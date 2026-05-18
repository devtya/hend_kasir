import 'package:drift/drift.dart';

class SupplierTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text()();
  TextColumn? get telepon => text().nullable()();
  TextColumn? get alamat => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
