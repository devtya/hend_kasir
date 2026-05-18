import 'package:drift/drift.dart';

class PendingPembelianItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pendingPembelianId => integer()();
  IntColumn get produkId => integer()();
  TextColumn get namaProduk => text()();
  IntColumn get jumlah => integer()();
  RealColumn get hargaBeliSatuan => real()();
  RealColumn get hargaBeliLama => real()();
  IntColumn get diskonTipe => integer().withDefault(const Constant(0))();
  RealColumn get diskonValue => real().withDefault(const Constant(0))();
}
