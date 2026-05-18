import 'package:drift/drift.dart' show Value;

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/hutang_piutang.dart' as domain;
import '../../domain/repositories/hutang_piutang_repository.dart';

class HutangPiutangRepositoryImpl implements HutangPiutangRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  HutangPiutangRepositoryImpl(this._db, this._syncHelper);

  domain.HutangPiutang _mapToDomain(HutangPiutangTableData data) {
    return domain.HutangPiutang(
      id: data.id,
      transaksiId: data.transaksiId,
      namaPelanggan: data.namaPelanggan,
      jumlah: data.jumlah,
      status: data.status,
      tanggalJatuhTempo: data.tanggalJatuhTempo,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<List<domain.HutangPiutang>> getAllHutang() async {
    final data = await _db.select(_db.hutangPiutangTable).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_mapToDomain).toList();
  }

  @override
  Future<List<domain.HutangPiutang>> getHutangByStatus(String status) async {
    final data = await (_db.select(
      _db.hutangPiutangTable,
    )..where((t) => t.status.equals(status))).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_mapToDomain).toList();
  }

  @override
  Future<void> addHutang(domain.HutangPiutang hutang) async {
    final newId = await _db
        .into(_db.hutangPiutangTable)
        .insert(
          HutangPiutangTableCompanion.insert(
            transaksiId: Value(hutang.transaksiId),
            namaPelanggan: hutang.namaPelanggan,
            jumlah: hutang.jumlah,
            status: Value(hutang.status),
            tanggalJatuhTempo: Value(hutang.tanggalJatuhTempo),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'hutang_piutang', localId: newId);
  }

  @override
  Future<void> updateStatus(int id, String status) async {
    await (_db.update(_db.hutangPiutangTable)..where((t) => t.id.equals(id)))
        .write(HutangPiutangTableCompanion(status: Value(status)));
    await _syncHelper.onUpdate(tableEntity: 'hutang_piutang', localId: id);
  }
}
