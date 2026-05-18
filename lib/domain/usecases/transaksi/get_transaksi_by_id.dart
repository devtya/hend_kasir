import '../../entities/transaksi.dart';
import '../../repositories/transaksi_repository.dart';

class GetTransaksiById {
  final TransaksiRepository repository;
  GetTransaksiById(this.repository);

  Future<Transaksi?> call(int id) => repository.getTransaksiById(id);
}
