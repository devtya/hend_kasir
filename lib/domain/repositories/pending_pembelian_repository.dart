import '../entities/pending_pembelian.dart';

abstract class PendingPembelianRepository {
  Future<List<PendingPembelian>> getAllPending();
  Future<PendingPembelian?> getPendingById(int id);
  Future<int> addPending(PendingPembelian pending);
  Future<void> deletePending(int id);
  Future<List<PendingPembelianItemData>> getItemsByPendingId(int pendingId);
  Future<void> addItem(int pendingId, PendingPembelianItemData item);
}

class PendingPembelianItemData {
  final int produkId;
  final String namaProduk;
  final int jumlah;
  final double hargaBeliSatuan;
  final double hargaBeliLama;
  final int diskonTipe;
  final double diskonValue;

  const PendingPembelianItemData({
    required this.produkId,
    required this.namaProduk,
    required this.jumlah,
    required this.hargaBeliSatuan,
    required this.hargaBeliLama,
    this.diskonTipe = 0,
    this.diskonValue = 0,
  });
}
