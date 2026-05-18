import 'package:equatable/equatable.dart';

class Notifikasi extends Equatable {
  final int? id;
  final String judul;
  final String pesan;
  final String tipe;
  final bool isRead;
  final DateTime? createdAt;

  const Notifikasi({
    this.id,
    required this.judul,
    required this.pesan,
    this.tipe = 'INFO',
    this.isRead = false,
    this.createdAt,
  });

  Notifikasi copyWith({
    int? id,
    String? judul,
    String? pesan,
    String? tipe,
    bool? isRead,
    DateTime? createdAt,
  }) {
    return Notifikasi(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      pesan: pesan ?? this.pesan,
      tipe: tipe ?? this.tipe,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, judul, pesan, tipe, isRead, createdAt];
}
