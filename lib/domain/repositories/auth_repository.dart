import '../entities/user.dart';

abstract class AuthRepository {
  /// Login with username or email
  Future<User?> login(String usernameOrEmail, String password);

  /// Keluar dan menghapus sesi
  Future<void> logout();

  /// Mengambil user yang sedang login dari sesi (jika ada)
  Future<User?> getCurrentUser();

  /// Mengambil daftar semua user (untuk admin)
  Future<List<User>> getAllUsers();

  /// Menambahkan akun user baru (kasir)
  Future<int> addUser(User user);

  /// Mengubah data akun user
  Future<void> updateUser(User user);

  /// Menghapus akun user
  Future<void> deleteUser(int id);

  /// Mendaftarkan toko baru + admin user + simpan ke Supabase
  Future<User> registerStore({
    required String namaToko,
    String? alamat,
    required String email,
    required String password,
    String? nama,
  });
}
