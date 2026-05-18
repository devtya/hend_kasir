import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/pending_order.dart' as domain;
import '../../domain/repositories/pending_order_repository.dart';

class PendingOrderRepositoryImpl implements PendingOrderRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  PendingOrderRepositoryImpl(this._db, this._syncHelper);

  domain.PendingOrder _map(PendingOrderTableData data) {
    return domain.PendingOrder(
      id: data.id,
      namaPelanggan: data.namaPelanggan,
      catatan: data.catatan,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<List<domain.PendingOrder>> getAllPending() async {
    final data = await _db.select(_db.pendingOrderTable).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_map).toList();
  }

  @override
  Future<domain.PendingOrder?> getPendingById(int id) async {
    final data = await (_db.select(
      _db.pendingOrderTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return data != null ? _map(data) : null;
  }

  @override
  Future<int> addPending(domain.PendingOrder pending) async {
    final newId = await _db
        .into(_db.pendingOrderTable)
        .insert(
          PendingOrderTableCompanion.insert(
            namaPelanggan: pending.namaPelanggan,
            catatan: Value(pending.catatan),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'pending_order', localId: newId);
    return newId;
  }

  @override
  Future<void> deletePending(int id) async {
    await (_db.delete(
      _db.pendingOrderTable,
    )..where((t) => t.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'pending_order', localId: id);
  }

  @override
  Future<List<CartItemData>> getItemsByPendingId(int pendingId) async {
    final data = await (_db.select(
      _db.pendingOrderItemTable,
    )..where((t) => t.pendingOrderId.equals(pendingId))).get();
    return data
        .map(
          (d) => CartItemData(
            produkId: d.produkId,
            namaProduk: d.namaProduk,
            hargaJual: d.hargaJual,
            jumlah: d.jumlah,
            diskonTipe: d.diskonTipe,
            diskonValue: d.diskonValue,
            subtotal: d.subtotal,
          ),
        )
        .toList();
  }

  @override
  Future<void> addItem(int pendingId, CartItemData item) async {
    final newId = await _db
        .into(_db.pendingOrderItemTable)
        .insert(
          PendingOrderItemTableCompanion.insert(
            pendingOrderId: pendingId,
            produkId: item.produkId,
            namaProduk: item.namaProduk,
            hargaJual: item.hargaJual,
            jumlah: item.jumlah,
            diskonTipe: Value(item.diskonTipe),
            diskonValue: Value(item.diskonValue),
            subtotal: item.subtotal,
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'pending_order_item', localId: newId);
  }
}
