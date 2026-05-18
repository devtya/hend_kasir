import '../../entities/supplier.dart';
import '../../repositories/supplier_repository.dart';

class SearchSupplier {
  final SupplierRepository repository;

  SearchSupplier(this.repository);

  Future<List<Supplier>> call(String query) => repository.searchSupplier(query);
}
