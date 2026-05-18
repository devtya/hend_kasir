import '../entities/item_transaksi.dart';
import '../entities/transaksi.dart';

abstract class TransaksiRepository {
  Future<List<Transaksi>> getAllTransaksi();
  Future<List<Transaksi>> getTransaksiByDate(DateTime date);
  Future<Transaksi?> getTransaksiById(int id);
  Future<int> addTransaksi(Transaksi transaksi);
  Future<void> addItemTransaksi(ItemTransaksi item);
  Future<List<ItemTransaksi>> getItemTransaksiByTransaksiId(int transaksiId);
  Future<double> getTotalOmsetToday();
  Future<Transaksi?> getLastTransaksiByProdukId(int produkId);
}
