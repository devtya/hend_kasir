import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text().nullable()();
  TextColumn get password => text()();
  TextColumn get role => text()(); // 'admin' or 'kasir'
  TextColumn get nama => text().nullable()();
  TextColumn get email => text().nullable().unique()();
  IntColumn get tokoId => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
