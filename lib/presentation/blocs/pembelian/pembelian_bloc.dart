import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/item_pembelian.dart';
import '../../../domain/repositories/pembelian_repository.dart';
import '../../../domain/usecases/stok/buat_pembelian.dart';
import 'pembelian_event.dart';
import 'pembelian_state.dart';

class PembelianBloc extends Bloc<PembelianEvent, PembelianState> {
  final PembelianRepository repository;
  final BuatPembelian buatPembelian;

  PembelianBloc({required this.repository, required this.buatPembelian})
    : super(PembelianInitial()) {
    on<LoadPembelian>(_onLoad);
    on<AddPembelianEvent>(_onAdd);
  }

  Future<void> _onLoad(
    LoadPembelian event,
    Emitter<PembelianState> emit,
  ) async {
    emit(PembelianLoading());
    try {
      final list = await repository.getAllPembelian();
      emit(PembelianLoaded(list));
    } catch (e) {
      emit(PembelianError(e.toString()));
    }
  }

  Future<void> _onAdd(
    AddPembelianEvent event,
    Emitter<PembelianState> emit,
  ) async {
    try {
      final items = event.items
          .map(
            (d) => ItemPembelian(
              produkId: d.produkId,
              pembelianId: 0,
              jumlah: d.jumlah,
              hargaBeliSatuan: d.hargaBeliSatuan,
              subtotal: d.hargaBeliSatuan * d.jumlah,
              satuanId: d.satuanId,
              konversi: d.konversi,
            ),
          )
          .toList();
      await buatPembelian(namaSupplier: event.namaSupplier, items: items);
      emit(const PembelianSuccess('Pembelian berhasil'));
      add(LoadPembelian());
    } catch (e) {
      emit(PembelianError(e.toString()));
    }
  }
}
