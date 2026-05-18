import 'package:drift/drift.dart';

class TokoTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text()();
  TextColumn? get alamat => text().nullable()();
  TextColumn? get telepon => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
