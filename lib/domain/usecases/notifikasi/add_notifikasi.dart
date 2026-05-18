import '../../entities/notifikasi.dart';
import '../../repositories/notifikasi_repository.dart';

class AddNotifikasi {
  final NotifikasiRepository repository;

  AddNotifikasi(this.repository);

  Future<void> call(Notifikasi notifikasi) {
    return repository.addNotifikasi(notifikasi);
  }
}
