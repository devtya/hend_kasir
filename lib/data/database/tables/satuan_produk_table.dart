import 'package:drift/drift.dart';

class SatuanProdukTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get produkId => integer()();
  TextColumn get nama => text()();
  RealColumn get konversi => real()();
  RealColumn get hargaBeli => real()();
  RealColumn get hargaJual => real()();
}
