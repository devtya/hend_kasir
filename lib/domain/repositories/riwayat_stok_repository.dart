import '../entities/riwayat_stok.dart';

abstract class RiwayatStokRepository {
  Future<List<RiwayatStok>> getRiwayatByProdukId(int produkId);
  Future<void> addRiwayat(RiwayatStok riwayat);
}
