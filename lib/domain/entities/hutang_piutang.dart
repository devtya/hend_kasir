import 'package:equatable/equatable.dart';

class HutangPiutang extends Equatable {
  final int? id;
  final int? transaksiId;
  final String namaPelanggan;
  final double jumlah;
  final String status;
  final DateTime? tanggalJatuhTempo;
  final DateTime? createdAt;

  const HutangPiutang({
    this.id,
    this.transaksiId,
    required this.namaPelanggan,
    required this.jumlah,
    this.status = 'belum_lunas',
    this.tanggalJatuhTempo,
    this.createdAt,
  });

  HutangPiutang copyWith({
    int? id,
    int? transaksiId,
    String? namaPelanggan,
    double? jumlah,
    String? status,
    DateTime? tanggalJatuhTempo,
    DateTime? createdAt,
  }) {
    return HutangPiutang(
      id: id ?? this.id,
      transaksiId: transaksiId ?? this.transaksiId,
      namaPelanggan: namaPelanggan ?? this.namaPelanggan,
      jumlah: jumlah ?? this.jumlah,
      status: status ?? this.status,
      tanggalJatuhTempo: tanggalJatuhTempo ?? this.tanggalJatuhTempo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    transaksiId,
    namaPelanggan,
    jumlah,
    status,
    tanggalJatuhTempo,
    createdAt,
  ];
}
