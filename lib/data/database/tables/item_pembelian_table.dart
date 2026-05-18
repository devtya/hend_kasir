import 'package:drift/drift.dart';

class ItemPembelianTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get pembelianId => integer()();
  IntColumn get produkId => integer()();
  IntColumn get jumlah => integer()();
  RealColumn get hargaBeliSatuan => real()();
  RealColumn get subtotal => real()();
}
