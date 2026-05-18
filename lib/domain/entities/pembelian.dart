import 'package:equatable/equatable.dart';

import 'item_pembelian.dart';

class Pembelian extends Equatable {
  final int? id;
  final String namaSupplier;
  final double totalHarga;
  final DateTime? createdAt;
  final List<ItemPembelian>? items;

  const Pembelian({
    this.id,
    required this.namaSupplier,
    required this.totalHarga,
    this.createdAt,
    this.items,
  });

  @override
  List<Object?> get props => [id, namaSupplier, totalHarga, createdAt, items];
}
