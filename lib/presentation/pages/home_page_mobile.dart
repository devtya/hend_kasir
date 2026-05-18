import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/injection.dart';
import '../../core/theme/app_theme.dart';
import '../blocs/auth/auth_bloc.dart';
import '../blocs/auth/auth_event.dart';
import '../blocs/auth/auth_state.dart';
import '../blocs/cashier/cashier_bloc.dart';
import '../blocs/hutang/hutang_bloc.dart';
import '../blocs/laporan/laporan_bloc.dart';
import '../blocs/notifikasi/notifikasi_bloc.dart';
import '../blocs/notifikasi/notifikasi_event.dart';
import '../blocs/notifikasi/notifikasi_state.dart';
import '../blocs/pembelian/pembelian_bloc.dart';
import '../blocs/produk/produk_bloc.dart';
import '../blocs/supplier/supplier_bloc.dart';
import '../blocs/transaksi/transaksi_bloc.dart';
import 'cashier_page.dart';
import 'hutang_page.dart';
import 'laporan_page.dart';
import 'notifikasi_page.dart';
import 'pembelian_page.dart';
import 'produk_page.dart';
import 'settings_page.dart';
import 'supplier_page.dart';
import 'transaksi_page.dart';
import 'user_management_page.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NotifikasiBloc>()..add(LoadNotifikasi()),
      child: const _HomeMobileView(),
    );
  }
}

class _HomeMobileView extends StatefulWidget {
  const _HomeMobileView();

  @override
  State<_HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<_HomeMobileView> {
  void _reloadNotifikasi() {
    if (mounted) {
      context.read<NotifikasiBloc>().add(LoadNotifikasi());
    }
  }

  void _navigateAndReload(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    ).then((_) => _reloadNotifikasi());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        String username = '';
        String role = 'kasir';
        if (authState is Authenticated) {
          username = authState.user.username;
          role = authState.user.role;
        }
        final isAdmin = role == 'admin';

        return Scaffold(
          appBar: AppBar(
            title: Text('Halo, $username! 👋'),
            centerTitle: false,
            actions: [
              BlocBuilder<NotifikasiBloc, NotifikasiState>(
                builder: (context, state) {
                  int unreadCount = 0;
                  if (state is NotifikasiLoaded) {
                    unreadCount = state.unreadNotifikasi.length;
                  }

                  return Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: context.read<NotifikasiBloc>(),
                                child: const NotifikasiPage(),
                              ),
                            ),
                          ).then((_) {
                            if (context.mounted) {
                              context.read<NotifikasiBloc>().add(
                                LoadNotifikasi(),
                              );
                            }
                          });
                        },
                      ),
                      if (unreadCount > 0)
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppTheme.warningRed,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '$unreadCount',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Apakah Anda yakin ingin keluar?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: const Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                            context.read<AuthBloc>().add(LogoutEvent());
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: AppTheme.warningRed,
                          ),
                          child: const Text('Logout'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: BlocBuilder<NotifikasiBloc, NotifikasiState>(
                  builder: (context, state) {
                    if (state is NotifikasiLoaded &&
                        state.unreadNotifikasi.isNotEmpty) {
                      final latestNotif = state.unreadNotifikasi.first;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                        child: Card(
                          color: AppTheme.warningOrange.withValues(alpha: 0.15),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: AppTheme.warningOrange.withValues(
                                alpha: 0.5,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.campaign,
                              color: AppTheme.warningOrange,
                              size: 32,
                            ),
                            title: Text(
                              latestNotif.judul,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppTheme.warningOrange,
                              ),
                            ),
                            subtitle: Text(
                              latestNotif.pesan,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<NotifikasiBloc>(),
                                    child: const NotifikasiPage(),
                                  ),
                                ),
                              ).then((_) {
                                if (context.mounted) {
                                  context.read<NotifikasiBloc>().add(
                                    LoadNotifikasi(),
                                  );
                                }
                              });
                            },
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio:
                      1.1,
                  children: [
                    _MenuGridCard(
                      icon: Icons.shopping_cart,
                      label: 'Kasir',
                      color: AppTheme.primaryGreen,
                      onTap: () {
                        _navigateAndReload(
                          BlocProvider.value(
                            value: sl<CashierBloc>(),
                            child: const CashierPage(),
                          ),
                        );
                      },
                    ),
                    _MenuGridCard(
                      icon: Icons.inventory_2,
                      label: 'Produk',
                      color: AppTheme.darkGreen,
                      onTap: () {
                        _navigateAndReload(
                          BlocProvider.value(
                            value: sl<ProdukBloc>(),
                            child: const ProdukPage(),
                          ),
                        );
                      },
                    ),
                    _MenuGridCard(
                      icon: Icons.shopping_bag,
                      label: 'Pembelian',
                      color: Colors.teal,
                      onTap: () {
                        _navigateAndReload(
                          BlocProvider.value(
                            value: sl<PembelianBloc>(),
                            child: const PembelianPage(),
                          ),
                        );
                      },
                    ),
                    if (isAdmin)
                      _MenuGridCard(
                        icon: Icons.business,
                        label: 'Supplier',
                        color: Colors.brown,
                        onTap: () {
                          _navigateAndReload(
                            BlocProvider.value(
                              value: sl<SupplierBloc>(),
                              child: const SupplierPage(),
                            ),
                          );
                        },
                      ),
                    _MenuGridCard(
                      icon: Icons.receipt_long,
                      label: 'Riwayat Transaksi',
                      color: Colors.blue,
                      onTap: () {
                        _navigateAndReload(
                          BlocProvider(
                            create: (_) => sl<TransaksiBloc>(),
                            child: const TransaksiPage(),
                          ),
                        );
                      },
                    ),
                    if (isAdmin)
                      _MenuGridCard(
                        icon: Icons.people,
                        label: 'Hutang Piutang',
                        color: AppTheme.warningOrange,
                        onTap: () {
                          _navigateAndReload(
                            BlocProvider.value(
                              value: sl<HutangBloc>(),
                              child: const HutangPage(),
                            ),
                          );
                        },
                      ),
                    if (isAdmin)
                      _MenuGridCard(
                        icon: Icons.bar_chart,
                        label: 'Laporan',
                        color: Colors.purple,
                        onTap: () {
                          _navigateAndReload(
                            BlocProvider.value(
                              value: sl<LaporanBloc>(),
                              child: const LaporanPage(),
                            ),
                          );
                        },
                      ),
                    if (isAdmin)
                      _MenuGridCard(
                        icon: Icons.manage_accounts,
                        label: 'Manajemen Pengguna',
                        color: Colors.indigo,
                        onTap: () {
                          _navigateAndReload(const UserManagementPage());
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MenuGridCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _MenuGridCard({
    required this.icon,
    required this.label,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: color.withValues(alpha: 0.15),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(height: 16),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
