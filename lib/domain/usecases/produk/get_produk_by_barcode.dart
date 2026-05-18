import '../../entities/produk.dart';
import '../../repositories/produk_repository.dart';

class GetProdukByBarcode {
  final ProdukRepository repository;
  GetProdukByBarcode(this.repository);

  Future<Produk?> call(String barcode) =>
      repository.getProdukByBarcode(barcode);
}
