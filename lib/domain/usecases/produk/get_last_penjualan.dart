import '../../entities/transaksi.dart';
import '../../repositories/transaksi_repository.dart';

class GetLastPenjualanByProduk {
  final TransaksiRepository repository;

  GetLastPenjualanByProduk(this.repository);

  Future<Transaksi?> call(int produkId) {
    return repository.getLastTransaksiByProdukId(produkId);
  }
}
