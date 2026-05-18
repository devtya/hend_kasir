import '../../repositories/notifikasi_repository.dart';

class WatchUnreadCount {
  final NotifikasiRepository repository;

  WatchUnreadCount(this.repository);

  Stream<int> call() {
    return repository.watchUnreadCount();
  }
}
