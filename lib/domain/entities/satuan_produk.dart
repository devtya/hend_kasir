import 'package:equatable/equatable.dart';

class SatuanProduk extends Equatable {
  final int? id;
  final int produkId;
  final String nama;
  final double konversi;
  final double hargaBeli;
  final double hargaJual;

  const SatuanProduk({
    this.id,
    required this.produkId,
    required this.nama,
    required this.konversi,
    required this.hargaBeli,
    required this.hargaJual,
  });

  SatuanProduk copyWith({
    int? id,
    int? produkId,
    String? nama,
    double? konversi,
    double? hargaBeli,
    double? hargaJual,
  }) {
    return SatuanProduk(
      id: id ?? this.id,
      produkId: produkId ?? this.produkId,
      nama: nama ?? this.nama,
      konversi: konversi ?? this.konversi,
      hargaBeli: hargaBeli ?? this.hargaBeli,
      hargaJual: hargaJual ?? this.hargaJual,
    );
  }

  @override
  List<Object?> get props => [
    id,
    produkId,
    nama,
    konversi,
    hargaBeli,
    hargaJual,
  ];
}
