import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_theme.dart';
import '../../domain/entities/item_pembelian.dart';
import '../../domain/entities/pembelian.dart';
import '../../core/di/injection.dart';
import '../blocs/pembelian/pembelian_bloc.dart';
import '../blocs/pembelian/pembelian_event.dart';
import '../blocs/pembelian/pembelian_state.dart';
import '../blocs/produk/produk_bloc.dart';
import 'pembelian_form_page.dart';
import 'pending_pembelian_page.dart';

class PembelianPage extends StatefulWidget {
  const PembelianPage({super.key});

  @override
  State<PembelianPage> createState() => _PembelianPageState();
}

class _PembelianPageState extends State<PembelianPage> {
  final _currency = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  final _dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  void initState() {
    super.initState();
    context.read<PembelianBloc>().add(LoadPembelian());
  }

  void _showDetailDialog(Pembelian p) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return FutureBuilder<List<ItemPembelian>>(
          future: context
              .read<PembelianBloc>()
              .repository
              .getItemsByPembelianId(p.id!),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final items = snapshot.data ?? [];
            return Container(
              padding: const EdgeInsets.all(16),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Detail Pembelian #${p.id}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Supplier: ${p.namaSupplier}',
                    style: const TextStyle(color: AppTheme.primaryGreen),
                  ),
                  const Divider(height: 24),
                  if (items.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Tidak ada item.'),
                    )
                  else
                    Expanded(
                      child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (ctx, idx) {
                          final item = items[idx];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      item.namaProduk ??
                                          'Produk #${item.produkId}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text('${item.jumlah}x '),
                                  Text(
                                    _currency.format(item.subtotal),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Pembelian',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _currency.format(p.totalHarga),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text('Tutup'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pembelian Barang')),
      body: BlocBuilder<PembelianBloc, PembelianState>(
        builder: (context, state) {
          if (state is PembelianLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PembelianError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<PembelianBloc>().add(LoadPembelian()),
                    child: const Text('Coba Lagi'),
                  ),
                ],
              ),
            );
          }
          if (state is PembelianLoaded) {
            if (state.list.isEmpty) {
              return const Center(child: Text('Belum ada pembelian'));
            }
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<PembelianBloc>().add(LoadPembelian()),
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  final p = state.list[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppTheme.lightGreen,
                        child: const Icon(
                          Icons.shopping_bag,
                          color: AppTheme.primaryGreen,
                        ),
                      ),
                      title: Text(p.namaSupplier),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(_currency.format(p.totalHarga)),
                          Text(
                            _dateFormat.format(p.createdAt!),
                            style: TextStyle(
                              fontSize: 12,
                              color: AppTheme.neutralGrey,
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => _showDetailDialog(p),
                    ),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'pendingPembelianBtn',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PendingPembelianPage()),
              ).then((_) => context.read<PembelianBloc>().add(LoadPembelian()));
            },
            backgroundColor: AppTheme.warningOrange,
            child: const Icon(Icons.pending_actions),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'addPembelianBtn',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(value: context.read<PembelianBloc>()),
                      BlocProvider.value(value: sl<ProdukBloc>()),
                    ],
                    child: const PembelianFormPage(),
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
