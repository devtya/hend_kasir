import 'package:drift/drift.dart';

class NotifikasiTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get judul => text()();
  TextColumn get pesan => text()();
  TextColumn get tipe =>
      text().withDefault(const Constant('INFO'))(); // INFO, WARNING, SUCCESS
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
