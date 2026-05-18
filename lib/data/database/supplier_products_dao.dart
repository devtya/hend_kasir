import 'package:drift/drift.dart';

import 'app_database.dart';

class SupplierProductsDao {
  final AppDatabase _db;

  SupplierProductsDao(this._db);

  Future<void> upsertSupplierProduct({
    required int supplierId,
    required int produkId,
    required double lastPrice,
  }) async {
    final existing = await (_db.select(
      _db.supplierProductsTable,
    )
      ..where((t) =>
          t.supplierId.equals(supplierId) & t.produkId.equals(produkId)))
      .getSingleOrNull();

    if (existing != null) {
      await (_db.update(_db.supplierProductsTable)
        ..where((t) => t.id.equals(existing.id))).write(
        SupplierProductsTableCompanion(
          lastPrice: Value(lastPrice),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      await _db.into(_db.supplierProductsTable).insert(
        SupplierProductsTableCompanion.insert(
          supplierId: supplierId,
          produkId: produkId,
          lastPrice: lastPrice,
          updatedAt: DateTime.now(),
        ),
      );
    }
  }

  Future<List<int>> getProductsBySupplier(int supplierId) async {
    final rows = await (_db.select(
      _db.supplierProductsTable,
    )..where((t) => t.supplierId.equals(supplierId))).get();
    return rows.map((r) => r.produkId).toList();
  }

  Future<List<int>> getSuppliersByProduct(int produkId) async {
    final rows = await (_db.select(
      _db.supplierProductsTable,
    )..where((t) => t.produkId.equals(produkId))).get();
    return rows.map((r) => r.supplierId).toList();
  }
}
