import '../../entities/item_pembelian.dart';
import '../../entities/pembelian.dart';
import '../../entities/riwayat_stok.dart';
import '../../repositories/pembelian_repository.dart';
import '../../repositories/produk_repository.dart';
import '../../repositories/riwayat_stok_repository.dart';

class UpdatePembelian {
  final PembelianRepository pembelianRepository;
  final ProdukRepository produkRepository;
  final RiwayatStokRepository riwayatStokRepository;

  UpdatePembelian({
    required this.pembelianRepository,
    required this.produkRepository,
    required this.riwayatStokRepository,
  });

  Future<void> call({
    required int pembelianId,
    required String namaSupplier,
    required List<ItemPembelian> itemsBaru,
  }) async {
    final itemsLama = await pembelianRepository.getItemsByPembelianId(
      pembelianId,
    );

    final totalHarga = itemsBaru.fold(0.0, (sum, item) => sum + item.subtotal);

    // Rollback stok dari item lama
    for (final item in itemsLama) {
      await _rollbackStok(item.produkId, item.jumlah, item.hargaBeliSatuan);
    }

    // Update header
    await pembelianRepository.updatePembelian(
      Pembelian(
        id: pembelianId,
        namaSupplier: namaSupplier,
        totalHarga: totalHarga,
      ),
    );

    // Hapus item lama
    await pembelianRepository.deleteItemsByPembelianId(pembelianId);

    // Insert item baru
    for (final item in itemsBaru) {
      await pembelianRepository.addItemPembelian(
        item.copyWith(pembelianId: pembelianId),
      );
    }

    // Apply stok & HPP baru
    for (final item in itemsBaru) {
      await _applyStokDanHpp(item.produkId, item.jumlah, item.hargaBeliSatuan);
    }

    // Write riwayat stok untuk item baru
    for (final item in itemsBaru) {
      await riwayatStokRepository.addRiwayat(
        RiwayatStok(
          produkId: item.produkId,
          tipe: 'masuk',
          jumlah: item.jumlah,
          keterangan: 'Edit Pembelian #$pembelianId',
        ),
      );
    }
  }

  Future<void> _rollbackStok(int produkId, int qtyLama, double hargaLama) async {
    final produk = await produkRepository.getProdukById(produkId);
    if (produk == null) return;

    final stokBaru = produk.stok - qtyLama;
    if (stokBaru < 0) return;

    double hppBaru;
    if (stokBaru <= 0) {
      hppBaru = produk.hargaBeli;
    } else {
      hppBaru = ((produk.hargaBeli * produk.stok) - (hargaLama * qtyLama)) / stokBaru;
    }

    await produkRepository.updateStok(produkId, stokBaru);
    await produkRepository.updateProduk(
      produk.copyWith(hargaBeli: hppBaru),
    );
  }

  Future<void> _applyStokDanHpp(int produkId, int qtyBaru, double hargaBaru) async {
    final produk = await produkRepository.getProdukById(produkId);
    if (produk == null) return;

    final stokAkhir = produk.stok + qtyBaru;
    final hppAkhir = ((produk.hargaBeli * produk.stok) + (hargaBaru * qtyBaru)) / stokAkhir;

    await produkRepository.updateStok(produkId, stokAkhir);
    await produkRepository.updateProduk(
      produk.copyWith(hargaBeli: hppAkhir),
    );
  }
}
