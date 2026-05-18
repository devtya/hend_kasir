import 'package:equatable/equatable.dart';

class ItemTransaksi extends Equatable {
  final int? id;
  final int transaksiId;
  final int produkId;
  final String? namaProduk;
  final int jumlah;
  final double hargaSatuan;
  final double subtotal;

  const ItemTransaksi({
    this.id,
    required this.transaksiId,
    required this.produkId,
    this.namaProduk,
    required this.jumlah,
    required this.hargaSatuan,
    required this.subtotal,
  });

  @override
  List<Object?> get props => [
    id,
    transaksiId,
    produkId,
    namaProduk,
    jumlah,
    hargaSatuan,
    subtotal,
  ];
}
