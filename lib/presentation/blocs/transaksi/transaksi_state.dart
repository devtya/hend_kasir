import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaksi.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();
  @override
  List<Object?> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoading extends TransaksiState {}

class TransaksiLoaded extends TransaksiState {
  final List<Transaksi> transaksiList;
  const TransaksiLoaded(this.transaksiList);
  @override
  List<Object?> get props => [transaksiList];
}

class TransaksiDetailLoaded extends TransaksiState {
  final Transaksi transaksi;
  const TransaksiDetailLoaded(this.transaksi);
  @override
  List<Object?> get props => [transaksi];
}

class TransaksiError extends TransaksiState {
  final String message;
  const TransaksiError(this.message);
  @override
  List<Object?> get props => [message];
}
