import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../database/app_database.dart';

class SyncHelper {
  final AppDatabase _db;
  final Uuid _uuid;

  SyncHelper(this._db) : _uuid = const Uuid();

  Future<String> onInsert({
    required String tableEntity,
    required int localId,
    int tokoId = 1,
  }) async {
    final uuid = _uuid.v4();
    await _db.into(_db.syncRecordTable).insert(
          SyncRecordTableCompanion(
            uuid: Value(uuid),
            tableEntity: Value(tableEntity),
            localId: Value(localId),
            updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
            tokoId: Value(tokoId),
          ),
        );
    return uuid;
  }

  Future<void> onUpdate({
    required String tableEntity,
    required int localId,
  }) async {
    final existing = await (_db.select(
      _db.syncRecordTable,
    )
      ..where((t) =>
          t.tableEntity.equals(tableEntity) & t.localId.equals(localId)))
      .get();

    if (existing.isNotEmpty) {
      await (_db.update(_db.syncRecordTable)
        ..where((t) =>
            t.tableEntity.equals(tableEntity) & t.localId.equals(localId)))
        .write(SyncRecordTableCompanion(
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          syncStatus: const Value('pending'),
        ));
    }
  }

  Future<void> onDelete({
    required String tableEntity,
    required int localId,
  }) async {
    final existing = await (_db.select(
      _db.syncRecordTable,
    )
      ..where((t) =>
          t.tableEntity.equals(tableEntity) & t.localId.equals(localId)))
      .get();

    if (existing.isNotEmpty) {
      await (_db.update(_db.syncRecordTable)
        ..where((t) =>
            t.tableEntity.equals(tableEntity) & t.localId.equals(localId)))
        .write(SyncRecordTableCompanion(
          isDeleted: const Value(true),
          updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
          syncStatus: const Value('pending'),
        ));
    }
  }
}
