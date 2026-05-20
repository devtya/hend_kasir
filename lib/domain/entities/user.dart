import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String username;
  final String password;
  final String role;
  final String? nama;
  final String? email;
  final int? tokoId;
  final DateTime? createdAt;

  const User({
    this.id,
    required this.username,
    required this.password,
    required this.role,
    this.nama,
    this.email,
    this.tokoId,
    this.createdAt,
  });

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? role,
    String? nama,
    String? email,
    int? tokoId,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      tokoId: tokoId ?? this.tokoId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props =>
      [id, username, password, role, nama, email, tokoId, createdAt];
}
