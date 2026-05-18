import 'package:drift/drift.dart';

class PendingPembelianTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplierId => integer().nullable()();
  TextColumn get namaSupplier => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isPpnEnabled => boolean().withDefault(const Constant(false))();
  RealColumn get ppnPercent => real().withDefault(const Constant(11.0))();
}
