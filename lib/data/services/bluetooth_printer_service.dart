import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import '../models/receipt_data.dart';
import 'printer_service.dart';

class BluetoothPrinterService implements PrinterService {
  static const _channel = MethodChannel('hend_kasir/bluetooth');

  BluetoothDevice? _device;
  BluetoothCharacteristic? _characteristic;

  @override
  String get printerType => 'bluetooth';

  static Future<List<Map<String, String>>> getBondedDevices() async {
    try {
      final result = await _channel.invokeListMethod<Map<dynamic, dynamic>>(
        'getBondedDevices',
      );
      if (result == null) return [];
      return result.map((m) => {
            'name': (m['name'] as String?) ?? '',
            'address': (m['address'] as String?) ?? '',
          }).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<BluetoothDevice>> scanPrinters() async {
    final devices = <BluetoothDevice>[];

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));
    FlutterBluePlus.scanResults.listen((results) {
      for (final result in results) {
        if (!devices.contains(result.device)) {
          devices.add(result.device);
        }
      }
    });

    await Future.delayed(const Duration(seconds: 6));
    await FlutterBluePlus.stopScan();
    return devices;
  }

  Future<bool> connect(BluetoothDevice device) async {
    try {
      _device = device;
      await _device!.connect(timeout: const Duration(seconds: 10));

      final services = await _device!.discoverServices();
      for (final service in services) {
        for (final characteristic in service.characteristics) {
          if (characteristic.properties.write ||
              characteristic.properties.writeWithoutResponse) {
            _characteristic = characteristic;
            return true;
          }
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> disconnect() async {
    await _device?.disconnect();
    _device = null;
    _characteristic = null;
  }

  @override
  Future<bool> isConnected() async {
    if (_device == null) return false;
    return _device!.isConnected;
  }

  Future<void> _writeBytes(List<int> bytes) async {
    if (_characteristic == null) {
      throw Exception('Printer tidak terhubung');
    }
    const chunkSize = 200;
    for (int i = 0; i < bytes.length; i += chunkSize) {
      final end = i + chunkSize < bytes.length ? i + chunkSize : bytes.length;
      final chunk = bytes.sublist(i, end);
      await _characteristic!.write(chunk, withoutResponse: false);
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }

  @override
  Future<bool> testPrint() async {
    try {
      if (!await isConnected()) return false;
      await _writeBytes([0x1B, 0x40]);
      await _writeBytes(utf8.encode('Test Print - OK\n\n'));
      await _writeBytes([0x1D, 0x56, 0x41, 0x03]);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> printReceipt(ReceiptData data) async {
    if (!await isConnected()) {
      throw Exception('Printer tidak terhubung');
    }
    final bytes = _buildEscPos(data);
    for (int i = 0; i < bytes.length; i += 512) {
      final chunk = bytes.sublist(
        i,
        i + 512 > bytes.length ? bytes.length : i + 512,
      );
      await _writeBytes(chunk);
    }
    return true;
  }

  List<int> _buildEscPos(ReceiptData data) {
    final buffer = <int>[];

    void add(List<int> bytes) => buffer.addAll(bytes);
    void addText(String text) => buffer.addAll(utf8.encode(text));

    final lebar = data.lebarKertas == 58 ? 32 : 48;

    // Map fontSize ke ESC/POS mode byte (print mode 0x1B, 0x21)
    int fontMode() {
      switch (data.fontSize) {
        case 'kecil':
          return 0x01; // condensed on
        case 'besar':
          return 0x30; // double height + double width
        default:
          return 0x00; // normal
      }
    }

    // Initialize
    add([0x1B, 0x40]);

    // Header - center, bold, double
    add([0x1B, 0x61, 0x01]); // center
    add([0x1B, 0x21, 0x38]); // bold + double height + double width (always large)
    addText(data.namaToko);
    add([0x0A]);
    add([0x1B, 0x21, fontMode()]); // base font size
    if (data.alamatToko.isNotEmpty) {
      addText(data.alamatToko);
      add([0x0A]);
    }
    add([0x0A]);

    // Info
    add([0x1B, 0x61, 0x00]); // left
    addText('#${data.transaksiId}');
    add([0x0A]);
    addText('Tgl: ${data.tanggal}');
    add([0x0A]);
    if (data.kasir.isNotEmpty) {
      addText('Kasir: ${data.kasir}');
      add([0x0A]);
    }
    addText('Metode: ${data.metodePembayaran}');
    add([0x0A]);
    addText('-' * lebar);
    add([0x0A]);

    // Items
    for (final item in data.items) {
      final nama = item.nama.length > lebar - 12
          ? item.nama.substring(0, lebar - 12)
          : item.nama;
      addText(nama);
      add([0x0A]);
      add([0x1B, 0x61, 0x02]); // right
      addText('${item.jumlah}x ${item.harga.toStringAsFixed(0)}');
      add([0x0A]);
      add([0x1B, 0x61, 0x00]); // left
      if (item.diskon > 0) {
        add([0x1B, 0x61, 0x02]);
        addText('  Diskon: -${item.diskon.toStringAsFixed(0)}');
        add([0x0A]);
        add([0x1B, 0x61, 0x00]);
      }
    }

    addText('-' * lebar);
    add([0x0A]);

    // Total
    add([0x1B, 0x61, 0x02]); // right
    add([0x1B, 0x21, 0x10 | fontMode()]); // bold + base font
    addText('Subtotal: ${data.subtotal.toStringAsFixed(0)}');
    add([0x0A]);
    if (data.totalDiskon > 0) {
      addText('Diskon: -${data.totalDiskon.toStringAsFixed(0)}');
      add([0x0A]);
    }
    add([0x1B, 0x21, 0x38]); // bold + double (always large for total amount)
    addText('TOTAL: ${data.totalBayar.toStringAsFixed(0)}');
    add([0x0A]);
    add([0x1B, 0x21, 0x00]); // normal

    add([0x0A]);
    addText('Dibayar: ${data.totalBayar.toStringAsFixed(0)}');
    add([0x0A]);
    if (data.kembalian > 0) {
      addText('Kembali: ${data.kembalian.toStringAsFixed(0)}');
      add([0x0A]);
    }

    // Footer
    add([0x0A]);
    addText('-' * lebar);
    add([0x0A]);
    add([0x1B, 0x61, 0x01]); // center
    addText('Terima kasih atas kunjungan Anda!');
    add([0x0A, 0x0A, 0x0A]);

    // Cut paper
    add([0x1D, 0x56, 0x41, 0x03]);

    return buffer;
  }
}
