import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/hutang_piutang_table.dart';
import 'tables/item_pembelian_table.dart';
import 'tables/item_transaksi_table.dart';
import 'tables/pembelian_table.dart';
import 'tables/pending_pembelian_table.dart';
import 'tables/pending_pembelian_item_table.dart';
import 'tables/pending_order_item_table.dart';
import 'tables/pending_order_table.dart';
import 'tables/produk_table.dart';
import 'tables/riwayat_stok_table.dart';
import 'tables/satuan_produk_table.dart';
import 'tables/supplier_table.dart';
import 'tables/toko_table.dart';
import 'tables/transaksi_table.dart';
import 'tables/notifikasi_table.dart';
import 'tables/user_table.dart';
import 'tables/supplier_products_table.dart';
import 'tables/sync_record_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ProdukTable,
    SatuanProdukTable,
    TransaksiTable,
    ItemTransaksiTable,
    HutangPiutangTable,
    RiwayatStokTable,
    PembelianTable,
    ItemPembelianTable,
    PendingOrderTable,
    PendingOrderItemTable,
    PendingPembelianTable,
    PendingPembelianItemTable,
    SupplierTable,
    NotifikasiTable,
    TokoTable,
    UserTable,
    SyncRecordTable,
    SupplierProductsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 13;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await into(tokoTable).insert(
        TokoTableCompanion.insert(nama: 'Toko Dedy'),
      );
      await into(userTable).insert(
        UserTableCompanion(
          username: const Value('admin'),
          password: const Value('123'),
          role: const Value('admin'),
          tokoId: const Value(1),
        ),
      );
    },
    onUpgrade: (m, from, to) async {
      if (from < 2) {
        await m.createTable(satuanProdukTable);
        await m.createTable(pembelianTable);
        await m.createTable(itemPembelianTable);
        await m.createTable(pendingOrderTable);
        await m.createTable(pendingOrderItemTable);
      }
      if (from < 3) {
        await m.createTable(supplierTable);
      }
      if (from < 4) {
        await m.createTable(notifikasiTable);
      }
      if (from < 5) {
        await m.createTable(pendingPembelianTable);
        await m.createTable(pendingPembelianItemTable);
      }
      if (from < 6) {
        await m.createTable(userTable);
        await into(userTable).insert(
          UserTableCompanion(
            username: const Value('admin'),
            password: const Value('123'),
            role: const Value('admin'),
            tokoId: const Value(1),
          ),
        );
      }
      if (from < 7) {
        await m.createTable(syncRecordTable);
      }
      if (from < 8) {
        await m.createTable(supplierProductsTable);
      }
      if (from < 9) {
        await m.createTable(tokoTable);
        await into(tokoTable).insert(
          TokoTableCompanion.insert(nama: 'Toko Dedy'),
        );
        await m.addColumn(userTable, userTable.tokoId);
        await customStatement('UPDATE user_table SET toko_id = 1');
        await m.addColumn(syncRecordTable, syncRecordTable.tokoId);
        await customStatement('UPDATE sync_record_table SET toko_id = 1');
      }
      if (from < 10) {
        await m.addColumn(pendingPembelianTable, pendingPembelianTable.isPpnEnabled);
        await m.addColumn(pendingPembelianTable, pendingPembelianTable.ppnPercent);
      }
      if (from < 11) {
        try {
          await m.addColumn(userTable, userTable.nama);
        } catch (_) {}
        try {
          await m.addColumn(userTable, userTable.email);
        } catch (_) {}
      }
      if (from < 12) {
        // placeholder for future migration
      }
      if (from < 13) {
        await customStatement('PRAGMA foreign_keys = OFF');
        await customStatement('''
          CREATE TABLE user_table_new (
            id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            password TEXT NOT NULL,
            role TEXT NOT NULL,
            nama TEXT,
            email TEXT,
            toko_id INTEGER NOT NULL DEFAULT 1,
            created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
            UNIQUE(email)
          )
        ''');
        await customStatement('''
          INSERT INTO user_table_new
          SELECT id, username, password, role, nama, email, toko_id, created_at
          FROM user_table
        ''');
        await customStatement('DROP TABLE user_table');
        await customStatement(
          'ALTER TABLE user_table_new RENAME TO user_table',
        );
        await customStatement('PRAGMA foreign_keys = ON');
      }
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    await Directory(dir.path).create(recursive: true);
    final file = File(p.join(dir.path, 'hend_kasir.db'));
    return NativeDatabase(file);
  });
}
