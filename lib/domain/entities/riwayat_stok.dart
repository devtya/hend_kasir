import 'package:equatable/equatable.dart';

class RiwayatStok extends Equatable {
  final int? id;
  final int produkId;
  final String tipe;
  final int jumlah;
  final String? keterangan;
  final DateTime? createdAt;

  const RiwayatStok({
    this.id,
    required this.produkId,
    required this.tipe,
    required this.jumlah,
    this.keterangan,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    produkId,
    tipe,
    jumlah,
    keterangan,
    createdAt,
  ];
}
