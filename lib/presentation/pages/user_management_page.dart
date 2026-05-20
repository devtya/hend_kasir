import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/injection.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../core/theme/app_theme.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  final AuthRepository _authRepo = sl<AuthRepository>();
  List<User> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() => _isLoading = true);
    try {
      final users = await _authRepo.getAllUsers();
      setState(() {
        _users = users;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Gagal memuat pengguna: $e')));
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _showUserDialog({User? user}) {
    final isEditing = user != null;
    final passwordCtrl = TextEditingController(text: user?.password ?? '');
    final namaCtrl = TextEditingController(text: user?.nama ?? '');
    final emailCtrl = TextEditingController(text: user?.email ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          isEditing
              ? (user.role == 'admin' ? 'Ubah Password Admin' : 'Edit Kasir')
              : 'Tambah Kasir',
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: namaCtrl,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final password = passwordCtrl.text.trim();
              final nama = namaCtrl.text.trim();
              final email = emailCtrl.text.trim();
              if (password.isEmpty) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text('Isi semua field wajib')),
                );
                return;
              }

              final newUser = User(
                id: user?.id,
                username: '', // akan auto-generate dari email di repo
                password: password,
                role: user?.role ?? 'kasir',
                nama: nama.isEmpty ? null : nama,
                email: email.isEmpty ? null : email,
              );

              try {
                if (isEditing) {
                  await _authRepo.updateUser(newUser);
                } else {
                  await _authRepo.addUser(newUser);
                }
                if (mounted) {
                  Navigator.pop(ctx);
                  _loadUsers();
                }
                // Refresh auth state jika user yang diupdate adalah user saat ini
                if (mounted) {
                  context.read<AuthBloc>().add(CheckAuthStatus());
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(content: Text('Gagal menyimpan: $e')),
                  );
                }
              }
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void _showResetPasswordDialog(User user) {
    final passwordCtrl = TextEditingController();
    final confirmCtrl = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Reset password untuk ${user.nama ?? user.username}'),
            const SizedBox(height: 16),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: 'Password Baru'),
              obscureText: true,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: confirmCtrl,
              decoration: const InputDecoration(labelText: 'Konfirmasi Password'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () async {
              final password = passwordCtrl.text.trim();
              final confirm = confirmCtrl.text.trim();
              if (password.isEmpty || confirm.isEmpty) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text('Isi semua field')),
                );
                return;
              }
              if (password != confirm) {
                ScaffoldMessenger.of(ctx).showSnackBar(
                  const SnackBar(content: Text('Password tidak cocok')),
                );
                return;
              }

              try {
                await _authRepo.updateUser(user.copyWith(password: password));
                if (ctx.mounted) Navigator.pop(ctx);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password ${user.nama ?? user.username} berhasil direset'),
                      backgroundColor: AppTheme.primaryGreen,
                    ),
                  );
                }
              } catch (e) {
                if (ctx.mounted) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text('Gagal: $e'),
                      backgroundColor: AppTheme.warningRed,
                    ),
                  );
                }
              }
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(User user) {
    if (user.role == 'admin') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Akun admin tidak dapat dihapus')),
      );
      return;
    }
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Akun'),
        content: Text(
            'Yakin ingin menghapus akun ${user.nama ?? user.username}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await _authRepo.deleteUser(user.id!);
                _loadUsers();
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Gagal menghapus: $e')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppTheme.warningRed),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Manajemen Pengguna')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: user.role == 'admin'
                        ? AppTheme.primaryGreen
                        : AppTheme.neutralGrey,
                    child: Icon(
                      user.role == 'admin'
                          ? Icons.admin_panel_settings
                          : Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(user.nama ?? user.username),
                  subtitle: Text('${user.role.toUpperCase()}${user.nama != null ? ' • ${user.username}' : ''}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.lock_reset, color: Colors.orange),
                        tooltip: 'Reset Password',
                        onPressed: () => _showResetPasswordDialog(user),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showUserDialog(user: user),
                      ),
                      if (user.role != 'admin')
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: AppTheme.warningRed,
                          ),
                          onPressed: () => _confirmDelete(user),
                        ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showUserDialog(),
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
