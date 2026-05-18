import '../../repositories/produk_repository.dart';

class DeleteSatuan {
  final ProdukRepository repository;
  DeleteSatuan(this.repository);

  Future<void> call(int id) => repository.deleteSatuan(id);
}
