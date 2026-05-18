import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/supplier.dart' as domain;
import '../../domain/repositories/supplier_repository.dart';

class SupplierRepositoryImpl implements SupplierRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  SupplierRepositoryImpl(this._db, this._syncHelper);

  domain.Supplier _map(SupplierTableData data) {
    return domain.Supplier(
      id: data.id,
      nama: data.nama,
      telepon: data.telepon,
      alamat: data.alamat,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<List<domain.Supplier>> getAllSupplier() async {
    final data = await _db.select(_db.supplierTable).get();
    return data.map(_map).toList();
  }

  @override
  Future<domain.Supplier?> getSupplierById(int id) async {
    final data = await (_db.select(
      _db.supplierTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return data != null ? _map(data) : null;
  }

  @override
  Future<List<domain.Supplier>> searchSupplier(String query) async {
    final likePattern = '%$query%';
    final data = await (_db.select(
      _db.supplierTable,
    )..where((t) => t.nama.like(likePattern))).get();
    return data.map(_map).toList();
  }

  @override
  Future<int> addSupplier(domain.Supplier supplier) async {
    final newId = await _db
        .into(_db.supplierTable)
        .insert(
          SupplierTableCompanion.insert(
            nama: supplier.nama,
            telepon: Value(supplier.telepon),
            alamat: Value(supplier.alamat),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'supplier', localId: newId);
    return newId;
  }

  @override
  Future<void> updateSupplier(domain.Supplier supplier) async {
    await (_db.update(
      _db.supplierTable,
    )..where((t) => t.id.equals(supplier.id!))).write(
      SupplierTableCompanion(
        nama: Value(supplier.nama),
        telepon: Value(supplier.telepon),
        alamat: Value(supplier.alamat),
      ),
    );
    await _syncHelper.onUpdate(tableEntity: 'supplier', localId: supplier.id!);
  }

  @override
  Future<void> deleteSupplier(int id) async {
    await (_db.delete(_db.supplierTable)..where((t) => t.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'supplier', localId: id);
  }
}
