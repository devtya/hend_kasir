import '../entities/produk.dart';
import '../entities/satuan_produk.dart';

abstract class ProdukRepository {
  Future<List<Produk>> getAllProduk();
  Future<List<Produk>> searchProduk(String query);
  Future<Produk?> getProdukById(int id);
  Future<Produk?> getProdukByBarcode(String barcode);
  Future<Set<String>> getAllBarcodes();
  Future<int> addProduk(Produk produk);
  Future<void> updateProduk(Produk produk);
  Future<void> deleteProduk(int id);
  Future<void> updateStok(int produkId, int jumlah);

  Future<List<SatuanProduk>> getSatuanByProdukId(int produkId);
  Future<void> addSatuan(SatuanProduk satuan);
  Future<void> updateSatuan(SatuanProduk satuan);
  Future<void> deleteSatuan(int id);
  Future<void> deleteSatuanByProdukId(int produkId);

  Future<({int imported, int skipped})> importAll({
    required List<Produk> produkList,
    required Map<String, List<SatuanProduk>> satuanByNama,
    required Set<String> existingBarcodes,
  });
}
