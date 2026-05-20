import '../entities/item_pembelian.dart';
import '../entities/pembelian.dart';

abstract class PembelianRepository {
  Future<List<Pembelian>> getAllPembelian();
  Future<Pembelian?> getPembelianById(int id);
  Future<int> addPembelian(Pembelian pembelian);
  Future<void> addItemPembelian(ItemPembelian item);
  Future<List<ItemPembelian>> getItemsByPembelianId(int pembelianId);
  Future<Pembelian?> getLastPembelianByProdukId(int produkId);

  Future<void> updatePembelian(Pembelian pembelian);
  Future<void> deleteItemsByPembelianId(int pembelianId);
  Future<void> deletePembelian(int id);
}
