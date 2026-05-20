import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String usernameOrEmail;
  final String password;

  const LoginEvent(this.usernameOrEmail, this.password);

  @override
  List<Object?> get props => [usernameOrEmail, password];
}

class LogoutEvent extends AuthEvent {}

class RegisterStoreEvent extends AuthEvent {
  final String namaToko;
  final String? alamat;
  final String email;
  final String password;
  final String? nama;

  const RegisterStoreEvent({
    required this.namaToko,
    this.alamat,
    required this.email,
    required this.password,
    this.nama,
  });

  @override
  List<Object?> get props => [namaToko, alamat, email, password, nama];
}
