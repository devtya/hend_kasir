import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaksi.dart';

abstract class LaporanState extends Equatable {
  const LaporanState();
  @override
  List<Object?> get props => [];
}

class LaporanInitial extends LaporanState {}

class LaporanLoading extends LaporanState {}

class LaporanLoaded extends LaporanState {
  final double omsetHariIni;
  final int totalTransaksi;
  final List<Transaksi> transaksiHariIni;

  const LaporanLoaded({
    this.omsetHariIni = 0,
    this.totalTransaksi = 0,
    this.transaksiHariIni = const [],
  });

  @override
  List<Object?> get props => [omsetHariIni, totalTransaksi, transaksiHariIni];
}

class LaporanError extends LaporanState {
  final String message;
  const LaporanError(this.message);
  @override
  List<Object?> get props => [message];
}
