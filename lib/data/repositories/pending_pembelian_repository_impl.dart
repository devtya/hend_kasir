import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/pending_pembelian.dart';
import '../../domain/repositories/pending_pembelian_repository.dart';

class PendingPembelianRepositoryImpl implements PendingPembelianRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  PendingPembelianRepositoryImpl(this._db, this._syncHelper);

  PendingPembelian _map(PendingPembelianTableData data) {
    return PendingPembelian(
      id: data.id,
      supplierId: data.supplierId,
      namaSupplier: data.namaSupplier,
      createdAt: data.createdAt,
      isPpnEnabled: data.isPpnEnabled,
      ppnPercent: data.ppnPercent,
    );
  }

  @override
  Future<List<PendingPembelian>> getAllPending() async {
    final data = await _db.select(_db.pendingPembelianTable).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_map).toList();
  }

  @override
  Future<PendingPembelian?> getPendingById(int id) async {
    final data = await (_db.select(
      _db.pendingPembelianTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return data != null ? _map(data) : null;
  }

  @override
  Future<int> addPending(PendingPembelian pending) async {
    final newId = await _db
        .into(_db.pendingPembelianTable)
        .insert(
          PendingPembelianTableCompanion.insert(
            supplierId: Value(pending.supplierId),
            namaSupplier: Value(pending.namaSupplier),
            isPpnEnabled: Value(pending.isPpnEnabled),
            ppnPercent: Value(pending.ppnPercent),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'pending_pembelian', localId: newId);
    return newId;
  }

  @override
  Future<void> deletePending(int id) async {
    await (_db.delete(
      _db.pendingPembelianItemTable,
    )..where((t) => t.pendingPembelianId.equals(id))).go();
    await (_db.delete(
      _db.pendingPembelianTable,
    )..where((t) => t.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'pending_pembelian', localId: id);
  }

  @override
  Future<List<PendingPembelianItemData>> getItemsByPendingId(
    int pendingId,
  ) async {
    final data = await (_db.select(
      _db.pendingPembelianItemTable,
    )..where((t) => t.pendingPembelianId.equals(pendingId))).get();

    return data
        .map(
          (item) => PendingPembelianItemData(
            produkId: item.produkId,
            namaProduk: item.namaProduk,
            jumlah: item.jumlah,
            hargaBeliSatuan: item.hargaBeliSatuan,
            hargaBeliLama: item.hargaBeliLama,
            diskonTipe: item.diskonTipe,
            diskonValue: item.diskonValue,
          ),
        )
        .toList();
  }

  @override
  Future<void> addItem(int pendingId, PendingPembelianItemData item) async {
    final newId = await _db
        .into(_db.pendingPembelianItemTable)
        .insert(
          PendingPembelianItemTableCompanion.insert(
            pendingPembelianId: pendingId,
            produkId: item.produkId,
            namaProduk: item.namaProduk,
            jumlah: item.jumlah,
            hargaBeliSatuan: item.hargaBeliSatuan,
            hargaBeliLama: item.hargaBeliLama,
            diskonTipe: Value(item.diskonTipe),
            diskonValue: Value(item.diskonValue),
          ),
        );
    await _syncHelper.onInsert(
        tableEntity: 'pending_pembelian_item', localId: newId);
  }
}
