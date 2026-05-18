import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String username;
  final String password;
  final String role;
  final DateTime? createdAt;

  const User({
    this.id,
    required this.username,
    required this.password,
    required this.role,
    this.createdAt,
  });

  User copyWith({
    int? id,
    String? username,
    String? password,
    String? role,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, username, password, role, createdAt];
}
