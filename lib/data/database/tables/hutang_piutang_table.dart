import 'package:drift/drift.dart';

class HutangPiutangTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn? get transaksiId => integer().nullable()();
  TextColumn get namaPelanggan => text()();
  RealColumn get jumlah => real()();
  TextColumn get status => text().withDefault(const Constant('belum_lunas'))();
  DateTimeColumn? get tanggalJatuhTempo => dateTime().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}
