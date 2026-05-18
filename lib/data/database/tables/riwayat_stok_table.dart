import 'package:drift/drift.dart';

class RiwayatStokTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get produkId => integer()();
  TextColumn get tipe => text()();
  IntColumn get jumlah => integer()();
  TextColumn? get keterangan => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
