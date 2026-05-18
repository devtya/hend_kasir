import 'package:drift/drift.dart';

class PendingOrderTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get namaPelanggan => text()();
  TextColumn? get catatan => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
