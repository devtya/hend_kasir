import 'package:drift/drift.dart';

class ProdukTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text()();
  TextColumn? get barcode => text().nullable()();
  RealColumn get hargaBeli => real()();
  RealColumn get hargaJual => real()();
  IntColumn get stok => integer().withDefault(const Constant(0))();
  TextColumn? get kategori => text().nullable()();
  TextColumn? get satuan => text().withDefault(const Constant('pcs'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
