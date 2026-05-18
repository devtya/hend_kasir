import '../../repositories/produk_repository.dart';

class DeleteProduk {
  final ProdukRepository repository;
  DeleteProduk(this.repository);

  Future<void> call(int id) => repository.deleteProduk(id);
}
