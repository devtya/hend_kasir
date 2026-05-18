import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/notifikasi.dart' as domain;
import '../../domain/repositories/notifikasi_repository.dart';

class NotifikasiRepositoryImpl implements NotifikasiRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  NotifikasiRepositoryImpl(this._db, this._syncHelper);

  domain.Notifikasi _mapToEntity(NotifikasiTableData data) {
    return domain.Notifikasi(
      id: data.id,
      judul: data.judul,
      pesan: data.pesan,
      tipe: data.tipe,
      isRead: data.isRead,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<void> addNotifikasi(domain.Notifikasi notifikasi) async {
    final newId = await _db
        .into(_db.notifikasiTable)
        .insert(
          NotifikasiTableCompanion.insert(
            judul: notifikasi.judul,
            pesan: notifikasi.pesan,
            tipe: Value(notifikasi.tipe),
            isRead: Value(notifikasi.isRead),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'notifikasi', localId: newId);
  }

  @override
  Future<List<domain.Notifikasi>> getAllNotifikasi() async {
    final query = _db.select(_db.notifikasiTable)
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);
    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<List<domain.Notifikasi>> getUnreadNotifikasi() async {
    final query = _db.select(_db.notifikasiTable)
      ..where((t) => t.isRead.equals(false))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);
    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Future<void> markAsRead(int id) async {
    await (_db.update(_db.notifikasiTable)..where((t) => t.id.equals(id)))
        .write(const NotifikasiTableCompanion(isRead: Value(true)));
    await _syncHelper.onUpdate(tableEntity: 'notifikasi', localId: id);
  }

  @override
  Future<List<domain.Notifikasi>> getNotifikasiByJudul(String search) async {
    final query = _db.select(_db.notifikasiTable)
      ..where((t) => t.judul.contains(search))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ]);
    final results = await query.get();
    return results.map(_mapToEntity).toList();
  }

  @override
  Stream<int> watchUnreadCount() {
    final query = _db.select(_db.notifikasiTable)
      ..where((t) => t.isRead.equals(false));
    return query.watch().map((list) => list.length);
  }
}
