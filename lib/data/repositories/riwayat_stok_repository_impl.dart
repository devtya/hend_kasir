import 'package:drift/drift.dart' show Value;

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/riwayat_stok.dart' as domain;
import '../../domain/repositories/riwayat_stok_repository.dart';

class RiwayatStokRepositoryImpl implements RiwayatStokRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  RiwayatStokRepositoryImpl(this._db, this._syncHelper);

  domain.RiwayatStok _mapToDomain(RiwayatStokTableData data) {
    return domain.RiwayatStok(
      id: data.id,
      produkId: data.produkId,
      tipe: data.tipe,
      jumlah: data.jumlah,
      keterangan: data.keterangan,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<List<domain.RiwayatStok>> getRiwayatByProdukId(int produkId) async {
    final data = await (_db.select(
      _db.riwayatStokTable,
    )..where((tbl) => tbl.produkId.equals(produkId))).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_mapToDomain).toList();
  }

  @override
  Future<void> addRiwayat(domain.RiwayatStok riwayat) async {
    final newId = await _db
        .into(_db.riwayatStokTable)
        .insert(
          RiwayatStokTableCompanion.insert(
            produkId: riwayat.produkId,
            tipe: riwayat.tipe,
            jumlah: riwayat.jumlah,
            keterangan: Value(riwayat.keterangan),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'riwayat_stok', localId: newId);
  }
}
