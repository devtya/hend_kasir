import 'package:drift/drift.dart';

class PembelianTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaSupplier => text()();
  RealColumn get totalHarga => real()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
