import '../../repositories/produk_repository.dart';

class DeleteSatuanByProdukId {
  final ProdukRepository repository;
  DeleteSatuanByProdukId(this.repository);

  Future<void> call(int produkId) =>
      repository.deleteSatuanByProdukId(produkId);
}
