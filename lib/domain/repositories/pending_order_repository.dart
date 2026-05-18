import '../entities/pending_order.dart';

abstract class PendingOrderRepository {
  Future<List<PendingOrder>> getAllPending();
  Future<PendingOrder?> getPendingById(int id);
  Future<int> addPending(PendingOrder pending);
  Future<void> deletePending(int id);
  Future<List<CartItemData>> getItemsByPendingId(int pendingId);
  Future<void> addItem(int pendingId, CartItemData item);
}

class CartItemData {
  final int produkId;
  final String namaProduk;
  final double hargaJual;
  final int jumlah;
  final int diskonTipe;
  final double diskonValue;
  final double subtotal;

  const CartItemData({
    required this.produkId,
    required this.namaProduk,
    required this.hargaJual,
    required this.jumlah,
    this.diskonTipe = 0,
    this.diskonValue = 0,
    this.subtotal = 0,
  });
}
