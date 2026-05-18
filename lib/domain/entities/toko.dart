import 'package:equatable/equatable.dart';

class Toko extends Equatable {
  final int? id;
  final String nama;
  final String? alamat;
  final String? telepon;
  final DateTime? createdAt;

  const Toko({
    this.id,
    required this.nama,
    this.alamat,
    this.telepon,
    this.createdAt,
  });

  Toko copyWith({
    int? id,
    String? nama,
    String? alamat,
    String? telepon,
    DateTime? createdAt,
  }) {
    return Toko(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, nama, alamat, telepon, createdAt];
}
