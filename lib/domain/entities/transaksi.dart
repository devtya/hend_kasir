import 'package:equatable/equatable.dart';

import 'item_transaksi.dart';

class Transaksi extends Equatable {
  final int? id;
  final double totalHarga;
  final double jumlahBayar;
  final double kembalian;
  final String status;
  final int? pelangganId;
  final DateTime? createdAt;
  final List<ItemTransaksi>? items;

  const Transaksi({
    this.id,
    required this.totalHarga,
    required this.jumlahBayar,
    required this.kembalian,
    this.status = 'lunas',
    this.pelangganId,
    this.createdAt,
    this.items,
  });

  Transaksi copyWith({
    int? id,
    double? totalHarga,
    double? jumlahBayar,
    double? kembalian,
    String? status,
    int? pelangganId,
    DateTime? createdAt,
    List<ItemTransaksi>? items,
  }) {
    return Transaksi(
      id: id ?? this.id,
      totalHarga: totalHarga ?? this.totalHarga,
      jumlahBayar: jumlahBayar ?? this.jumlahBayar,
      kembalian: kembalian ?? this.kembalian,
      status: status ?? this.status,
      pelangganId: pelangganId ?? this.pelangganId,
      createdAt: createdAt ?? this.createdAt,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [
    id,
    totalHarga,
    jumlahBayar,
    kembalian,
    status,
    pelangganId,
    createdAt,
    items,
  ];
}
