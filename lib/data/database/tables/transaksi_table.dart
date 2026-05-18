import 'package:drift/drift.dart';

class TransaksiTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  RealColumn get totalHarga => real()();
  RealColumn get jumlahBayar => real()();
  RealColumn get kembalian => real()();
  TextColumn get status => text().withDefault(const Constant('lunas'))();
  IntColumn? get pelangganId => integer().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
