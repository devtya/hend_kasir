import 'package:drift/drift.dart';

class PendingOrderItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pendingOrderId => integer()();
  IntColumn get produkId => integer()();
  TextColumn get namaProduk => text()();
  RealColumn get hargaJual => real()();
  IntColumn get jumlah => integer()();
  IntColumn get diskonTipe => integer().withDefault(const Constant(0))();
  RealColumn get diskonValue => real().withDefault(const Constant(0))();
  RealColumn get subtotal => real()();
}
