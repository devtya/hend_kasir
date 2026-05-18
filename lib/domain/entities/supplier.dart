import 'package:equatable/equatable.dart';

class Supplier extends Equatable {
  final int? id;
  final String nama;
  final String? telepon;
  final String? alamat;
  final DateTime? createdAt;

  const Supplier({
    this.id,
    required this.nama,
    this.telepon,
    this.alamat,
    this.createdAt,
  });

  Supplier copyWith({
    int? id,
    String? nama,
    String? telepon,
    String? alamat,
    DateTime? createdAt,
  }) {
    return Supplier(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      telepon: telepon ?? this.telepon,
      alamat: alamat ?? this.alamat,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, nama, telepon, alamat, createdAt];
}
