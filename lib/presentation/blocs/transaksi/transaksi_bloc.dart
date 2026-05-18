import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/transaksi/get_all_transaksi.dart';
import '../../../domain/usecases/transaksi/get_transaksi_by_id.dart';
import 'transaksi_event.dart';
import 'transaksi_state.dart';

class TransaksiBloc extends Bloc<TransaksiEvent, TransaksiState> {
  final GetAllTransaksi getAllTransaksi;
  final GetTransaksiById getTransaksiById;

  TransaksiBloc({required this.getAllTransaksi, required this.getTransaksiById})
    : super(TransaksiInitial()) {
    on<LoadTransaksi>(_onLoadTransaksi);
    on<LoadTransaksiDetail>(_onLoadDetail);
  }

  Future<void> _onLoadTransaksi(
    LoadTransaksi event,
    Emitter<TransaksiState> emit,
  ) async {
    emit(TransaksiLoading());
    try {
      final list = await getAllTransaksi();
      emit(TransaksiLoaded(list));
    } catch (e) {
      emit(TransaksiError(e.toString()));
    }
  }

  Future<void> _onLoadDetail(
    LoadTransaksiDetail event,
    Emitter<TransaksiState> emit,
  ) async {
    emit(TransaksiLoading());
    try {
      final transaksi = await getTransaksiById(event.id);
      if (transaksi != null) {
        emit(TransaksiDetailLoaded(transaksi));
      } else {
        emit(TransaksiError('Transaksi tidak ditemukan'));
      }
    } catch (e) {
      emit(TransaksiError(e.toString()));
    }
  }
}
