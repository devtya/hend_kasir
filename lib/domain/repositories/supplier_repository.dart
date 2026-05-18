import '../entities/supplier.dart';

abstract class SupplierRepository {
  Future<List<Supplier>> getAllSupplier();
  Future<Supplier?> getSupplierById(int id);
  Future<List<Supplier>> searchSupplier(String query);
  Future<int> addSupplier(Supplier supplier);
  Future<void> updateSupplier(Supplier supplier);
  Future<void> deleteSupplier(int id);
}
