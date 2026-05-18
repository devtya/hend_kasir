import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

Future<String?> showBarcodeScannerDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (ctx) {
      if (Platform.isWindows) {
        return _buildManualInput(ctx);
      }
      return _buildCameraScanner(ctx);
    },
  );
}

AlertDialog _buildCameraScanner(BuildContext context) {
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    content: SizedBox(
      width: double.maxFinite,
      height: 300,
      child: MobileScanner(
        controller: MobileScannerController(
          formats: const [
            BarcodeFormat.code128,
            BarcodeFormat.code39,
            BarcodeFormat.code93,
            BarcodeFormat.codabar,
            BarcodeFormat.ean13,
            BarcodeFormat.ean8,
            BarcodeFormat.itf,
            BarcodeFormat.upcA,
            BarcodeFormat.upcE,
          ],
        ),
        onDetect: (capture) {
          final barcode = capture.barcodes.firstOrNull?.rawValue;
          if (barcode != null) {
            Navigator.pop(context, barcode);
          }
        },
      ),
    ),
  );
}

AlertDialog _buildManualInput(BuildContext context) {
  final controller = TextEditingController();
  return AlertDialog(
    title: const Text('Input Barcode'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Ketik barcode secara manual atau gunakan scanner USB (keyboard wedge).',
          style: TextStyle(fontSize: 13),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Barcode',
            hintText: 'Masukkan barcode...',
            prefixIcon: Icon(Icons.qr_code),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              Navigator.pop(context, value.trim());
            }
          },
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Batal'),
      ),
      ElevatedButton(
        onPressed: () {
          if (controller.text.trim().isNotEmpty) {
            Navigator.pop(context, controller.text.trim());
          }
        },
        child: const Text('Cari'),
      ),
    ],
  );
}
