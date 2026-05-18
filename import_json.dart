// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

const supabaseUrl = 'https://uevtfoibbyprqyoyhndc.supabase.co';
const supabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVldnRmb2liYnlwcnF5b3lobmRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg4MDY3MzYsImV4cCI6MjA5NDM4MjczNn0.BpIoEpSvfOZVtyWywxDfoxdDA9zVGxrPUC5a7u_ulI0';

void main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart run import_json.dart <path_to_json_file>');
    exit(1);
  }

  final filePath = args[0];
  if (!File(filePath).existsSync()) {
    print('File not found: $filePath');
    exit(1);
  }

  print('Reading file...');
  final raw = await File(filePath).readAsString();
  final List<dynamic> allRecords = jsonDecode(raw) as List<dynamic>;
  print('Total records to import: ${allRecords.length}');

  final client = HttpClient();
  client.badCertificateCallback = (_, _, _) => false;

  int success = 0;
  int fail = 0;
  const batchSize = 100;

  for (int i = 0; i < allRecords.length; i += batchSize) {
    final batch = allRecords.skip(i).take(batchSize).toList();
    final payload = <Map<String, dynamic>>[];

    for (final record in batch) {
      final map = record as Map<String, dynamic>;
      final uuid = map['_uuid'] as String;
      final updatedAt = map['_updated_at'] as int? ??
          DateTime.now().millisecondsSinceEpoch;

      payload.add({
        'uuid': uuid,
        'data': jsonEncode(map),
        'updated_at': updatedAt,
      });
    }

    try {
      final request = await client.postUrl(
        Uri.parse('$supabaseUrl/rest/v1/records'),
      );
      request.headers.set('Content-Type', 'application/json');
      request.headers.set('apikey', supabaseAnonKey);
      request.headers.set('Authorization', 'Bearer $supabaseAnonKey');
      request.headers.set('Prefer', 'resolution=merge-duplicates');

      request.write(jsonEncode(payload));
      final response = await request.close();

      if (response.statusCode == 200 || response.statusCode == 201) {
        success += batch.length;
        print('OK: ${i + 1}-${i + batch.length} / ${allRecords.length}');
      } else {
        final body = await response.transform(utf8.decoder).join();
        print('FAIL (${response.statusCode}): ${body.substring(0, 200)}');
        fail += batch.length;
      }
    } catch (e) {
      print('ERROR: $e');
      fail += batch.length;
    }
  }

  client.close();
  print('\nSelesai! $success records berhasil diimport, $fail gagal.');
}
