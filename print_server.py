"""
PC Print Server — FastAPI + python-escpos
Menerima data receipt dari HP via HTTP, print ke USB thermal printer.

Setup:
  pip install fastapi uvicorn python-escpos
  python print_server.py

Default: http://0.0.0.0:5000/print
"""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import uvicorn
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

app = FastAPI(title="Hend Kasir Print Server")

# Izinkan semua origin (HP di network yang sama)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)


# ── Models ──────────────────────────────────────────────

class ReceiptItem(BaseModel):
    nama: str
    jumlah: int
    harga: float
    diskon: float = 0.0


class ReceiptData(BaseModel):
    nama_toko: str = "Toko"
    alamat_toko: str = ""
    transaksi_id: int
    tanggal: str
    kasir: str = ""
    items: List[ReceiptItem]
    subtotal: float
    total_diskon: float = 0.0
    total_bayar: float
    kembalian: float = 0.0
    metode_pembayaran: str = "Tunai"
    lebar_kertas: int = 58  # 58mm atau 80mm
    font_size: str = "normal"  # kecil, normal, besar


class PrinterInfo(BaseModel):
    type: str = "usb"  # usb, network
    vendor_id: Optional[int] = None
    product_id: Optional[int] = None
    in_ep: Optional[int] = None
    out_ep: Optional[int] = None
    interface: Optional[int] = None
    ip: Optional[str] = None
    port: Optional[int] = None


# ── Printer Manager ─────────────────────────────────────

class PrinterManager:
    def __init__(self):
        self.printer = None
        self.current_config: Optional[PrinterInfo] = None

    def connect(self, config: PrinterInfo) -> bool:
        """Connect ke printer berdasarkan konfigurasi."""
        try:
            from escpos.printer import Usb, Network

            if config.type == "usb":
                # Auto-detect jika vendor_id/product_id tidak diisi
                if config.vendor_id and config.product_id:
                    self.printer = Usb(
                        config.vendor_id,
                        config.product_id,
                        in_ep=config.in_ep or 0x82,
                        out_ep=config.out_ep or 0x01,
                        interface=config.interface or 0,
                    )
                else:
                    # Auto-detect: cari printer USB pertama
                    import usb.core
                    devices = usb.core.find(find_all=True)
                    for dev in devices:
                        # Filter device yang kemungkinan printer thermal
                        if dev.bDeviceClass in (0, 7, 255):
                            self.printer = Usb(
                                dev.idVendor,
                                dev.idProduct,
                                in_ep=0x82,
                                out_ep=0x01,
                            )
                            logger.info(
                                f"Auto-detected printer: "
                                f"VID={hex(dev.idVendor)} PID={hex(dev.idProduct)}"
                            )
                            break

                    if self.printer is None:
                        logger.warning(
                            "Tidak ada printer USB terdeteksi. "
                            "Silakan isi vendor_id dan product_id."
                        )
                        return False

            elif config.type == "network":
                self.printer = Network(
                    config.ip or "192.168.1.100",
                    config.port or 9100,
                )

            self.current_config = config
            logger.info(f"Printer connected: {config.type}")
            return True

        except Exception as e:
            logger.error(f"Failed to connect printer: {e}")
            return False

    def print_receipt(self, data: ReceiptData) -> bool:
        """Print receipt dalam format ESC-POS."""
        if self.printer is None:
            logger.error("Printer not connected")
            return False

        try:
            p = self.printer

            # ── Mapping font size ──
            fs = data.font_size
            body_bold = fs == "besar"
            body_dw = fs == "besar"
            body_condensed = fs == "kecil"

            # ── Reset printer (atasi bentrok setting dari aplikasi lain) ──
            p.initialize()

            # ── Header ──
            lebar = 32 if data.lebar_kertas == 58 else 48
            is_narrow = data.lebar_kertas == 58
            p.set(align="center", bold=True, double_width=is_narrow, double_height=is_narrow)
            p.textln(data.nama_toko)
            p.set(bold=False, double_width=False, double_height=False)
            if data.alamat_toko:
                p.textln(data.alamat_toko)
            p.textln("")

            # ── Info Transaksi ──
            p.set(align="left")
            p.textln(f"#{data.transaksi_id}")
            p.textln(f"Tgl: {data.tanggal}")
            if data.kasir:
                p.textln(f"Kasir: {data.kasir}")
            p.textln(f"Metode: {data.metode_pembayaran}")
            p.textln("-" * lebar)

            # ── Items ──
            for item in data.items:
                nama = item.nama[:lebar - 12]  # Batasi panjang nama
                qty_harga = f"{item.jumlah}x {item.harga:,.0f}"

                p.set(condensed=body_condensed)
                p.textln(nama)
                p.set(align="right", bold=body_bold, double_width=body_dw, condensed=body_condensed)
                p.textln(qty_harga)
                p.set(align="left", bold=body_bold, double_width=body_dw, condensed=body_condensed)

                if item.diskon > 0:
                    p.set(align="right")
                    p.textln(f"  Diskon: -{item.diskon:,.0f}")

            p.textln("-" * lebar)

            # ── Total ──
            p.set(align="right", bold=True, condensed=body_condensed)
            p.textln(f"Subtotal: {data.subtotal:,.0f}")
            if data.total_diskon > 0:
                p.textln(f"Diskon: -{data.total_diskon:,.0f}")
            p.set(bold=True, double_width=is_narrow, double_height=is_narrow)
            p.textln(f"TOTAL: {data.total_bayar:,.0f}")
            p.set(bold=False, double_width=False, double_height=False)

            # ── Pembayaran ──
            p.textln("")
            p.set(align="right", condensed=body_condensed)
            p.textln(f"Dibayar: {data.total_bayar:,.0f}")
            if data.kembalian > 0:
                p.textln(f"Kembali: {data.kembalian:,.0f}")

            # ── Footer ──
            p.textln("")
            p.textln("-" * lebar)
            p.set(align="center", condensed=body_condensed)
            p.textln("Terima kasih atas kunjungan Anda!")
            p.textln("")
            p.textln("")

            # ── Cut Paper ──
            p.cut()

            # ── Reset printer ke default (biar tidak bentrok dengan iPOS) ──
            p.initialize()

            logger.info(f"Receipt #{data.transaksi_id} printed successfully")
            return True

        except Exception as e:
            logger.error(f"Print failed: {e}")
            return False

    def test_print(self) -> bool:
        """Test print sederhana."""
        if self.printer is None:
            return False
        try:
            self.printer.textln("Test Print - OK")
            self.printer.cut()
            return True
        except Exception as e:
            logger.error(f"Test print failed: {e}")
            return False

    def disconnect(self):
        """Disconnect printer."""
        if self.printer:
            try:
                self.printer.close()
            except:
                pass
            self.printer = None


printer_mgr = PrinterManager()


# ── API Endpoints ───────────────────────────────────────

@app.get("/health")
def health():
    """Health check."""
    return {
        "status": "ok",
        "printer_connected": printer_mgr.printer is not None,
    }


@app.post("/connect")
def connect_printer(config: PrinterInfo):
    """Connect ke printer."""
    success = printer_mgr.connect(config)
    if success:
        return {"status": "connected", "type": config.type}
    raise HTTPException(status_code=500, detail="Gagal connect ke printer")


@app.post("/test-print")
def test_print():
    """Test print."""
    success = printer_mgr.test_print()
    if success:
        return {"status": "ok"}
    raise HTTPException(status_code=500, detail="Printer tidak terhubung")


@app.post("/print")
def print_receipt(data: ReceiptData):
    """Print receipt."""
    success = printer_mgr.print_receipt(data)
    if success:
        return {"status": "printed", "transaksi_id": data.transaksi_id}
    raise HTTPException(status_code=500, detail="Gagal print. Pastikan printer terhubung.")


@app.post("/disconnect")
def disconnect_printer():
    """Disconnect printer."""
    printer_mgr.disconnect()
    return {"status": "disconnected"}


# ── Auto-connect saat startup ──────────────────────────

@app.on_event("startup")
async def startup():
    """Auto-connect ke printer USB saat server start."""
    config = PrinterInfo(type="usb")
    printer_mgr.connect(config)


if __name__ == "__main__":
    print("=" * 50)
    print("  Hend Kasir Print Server")
    print("  http://0.0.0.0:5000")
    print("=" * 50)
    print()
    print("Endpoints:")
    print("  GET  /health        - Cek status")
    print("  POST /connect       - Connect printer")
    print("  POST /print         - Print receipt")
    print("  POST /test-print    - Test print")
    print("  POST /disconnect    - Disconnect printer")
    print()
    print("Tekan Ctrl+C untuk stop.")
    print()

    uvicorn.run(app, host="0.0.0.0", port=5000)
