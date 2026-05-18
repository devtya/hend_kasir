import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class CheckAuthStatus extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  const LoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class LogoutEvent extends AuthEvent {}

class RegisterStoreEvent extends AuthEvent {
  final String namaToko;
  final String? alamat;
  final String username;
  final String password;

  const RegisterStoreEvent({
    required this.namaToko,
    this.alamat,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [namaToko, alamat, username, password];
}
