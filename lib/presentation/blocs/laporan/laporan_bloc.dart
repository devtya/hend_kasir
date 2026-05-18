import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/transaksi_repository.dart';
import 'laporan_event.dart';
import 'laporan_state.dart';

class LaporanBloc extends Bloc<LaporanEvent, LaporanState> {
  final TransaksiRepository transaksiRepository;

  LaporanBloc({required this.transaksiRepository}) : super(LaporanInitial()) {
    on<LoadLaporan>(_onLoad);
  }

  Future<void> _onLoad(LoadLaporan event, Emitter<LaporanState> emit) async {
    emit(LaporanLoading());
    try {
      final today = DateTime.now();
      final transaksiList = await transaksiRepository.getTransaksiByDate(today);
      final omset = transaksiList.fold(
        0.0,
        (sum, t) => sum + (t.status == 'lunas' ? t.totalHarga : 0),
      );
      emit(
        LaporanLoaded(
          omsetHariIni: omset,
          totalTransaksi: transaksiList.length,
          transaksiHariIni: transaksiList,
        ),
      );
    } catch (e) {
      emit(LaporanError(e.toString()));
    }
  }
}
