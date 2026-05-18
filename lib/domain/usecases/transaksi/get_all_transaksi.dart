import '../../entities/transaksi.dart';
import '../../repositories/transaksi_repository.dart';

class GetAllTransaksi {
  final TransaksiRepository repository;
  GetAllTransaksi(this.repository);

  Future<List<Transaksi>> call() => repository.getAllTransaksi();
}
