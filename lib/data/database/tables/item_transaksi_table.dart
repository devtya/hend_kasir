import 'package:drift/drift.dart';

class ItemTransaksiTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get transaksiId => integer()();
  IntColumn get produkId => integer()();
  IntColumn get jumlah => integer()();
  RealColumn get hargaSatuan => real()();
  RealColumn get subtotal => real()();
}
