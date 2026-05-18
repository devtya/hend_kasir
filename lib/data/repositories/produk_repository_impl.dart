import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/produk.dart' as domain;
import '../../domain/entities/satuan_produk.dart' as domain;
import '../../domain/repositories/produk_repository.dart';

class ProdukRepositoryImpl implements ProdukRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  ProdukRepositoryImpl(this._db, this._syncHelper);

  domain.Produk _mapToDomain(ProdukTableData data) {
    return domain.Produk(
      id: data.id,
      nama: data.nama,
      barcode: data.barcode,
      hargaBeli: data.hargaBeli,
      hargaJual: data.hargaJual,
      stok: data.stok,
      kategori: data.kategori,
      satuan: data.satuan,
      createdAt: data.createdAt,
    );
  }

  domain.SatuanProduk _mapSatuan(SatuanProdukTableData data) {
    return domain.SatuanProduk(
      id: data.id,
      produkId: data.produkId,
      nama: data.nama,
      konversi: data.konversi,
      hargaBeli: data.hargaBeli,
      hargaJual: data.hargaJual,
    );
  }

  @override
  Future<List<domain.Produk>> getAllProduk() async {
    final data = await _db.select(_db.produkTable).get();
    final result = data.map(_mapToDomain).toList();
    for (final produk in result) {
      final satuanList = await getSatuanByProdukId(produk.id!);
      result[result.indexOf(produk)] = produk.copyWith(satuanList: satuanList);
    }
    return result;
  }

  @override
  Future<List<domain.Produk>> searchProduk(String query) async {
    final likePattern = '%$query%';
    final data = await (_db.select(
      _db.produkTable,
    )..where((tbl) => tbl.nama.like(likePattern))).get();
    final result = data.map(_mapToDomain).toList();
    for (final produk in result) {
      final satuanList = await getSatuanByProdukId(produk.id!);
      result[result.indexOf(produk)] = produk.copyWith(satuanList: satuanList);
    }
    return result;
  }

  @override
  Future<domain.Produk?> getProdukById(int id) async {
    final data = await (_db.select(
      _db.produkTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
    if (data == null) return null;
    final satuanList = await getSatuanByProdukId(data.id);
    return _mapToDomain(data).copyWith(satuanList: satuanList);
  }

  @override
  Future<domain.Produk?> getProdukByBarcode(String barcode) async {
    final data = await (_db.select(
      _db.produkTable,
    )..where((tbl) => tbl.barcode.equals(barcode))).getSingleOrNull();
    if (data == null) return null;
    final satuanList = await getSatuanByProdukId(data.id);
    return _mapToDomain(data).copyWith(satuanList: satuanList);
  }

  @override
  Future<Set<String>> getAllBarcodes() async {
    final rows = await _db.select(_db.produkTable).get();
    return rows
        .map((r) => r.barcode)
        .where((b) => b != null && b.isNotEmpty)
        .cast<String>()
        .toSet();
  }

  @override
  Future<int> addProduk(domain.Produk produk) async {
    final newId = await _db
        .into(_db.produkTable)
        .insert(
          ProdukTableCompanion.insert(
            nama: produk.nama,
            barcode: Value(produk.barcode),
            hargaBeli: produk.hargaBeli,
            hargaJual: produk.hargaJual,
            stok: Value(produk.stok),
            kategori: Value(produk.kategori),
            satuan: Value(produk.satuan ?? 'pcs'),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'produk', localId: newId);
    return newId;
  }

  @override
  Future<void> updateProduk(domain.Produk produk) async {
    await (_db.update(
      _db.produkTable,
    )..where((tbl) => tbl.id.equals(produk.id!))).write(
      ProdukTableCompanion(
        nama: Value(produk.nama),
        barcode: Value(produk.barcode),
        hargaBeli: Value(produk.hargaBeli),
        hargaJual: Value(produk.hargaJual),
        kategori: Value(produk.kategori),
        satuan: Value(produk.satuan ?? 'pcs'),
      ),
    );
    await _syncHelper.onUpdate(tableEntity: 'produk', localId: produk.id!);
  }

  @override
  Future<void> deleteProduk(int id) async {
    await (_db.delete(_db.produkTable)..where((tbl) => tbl.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'produk', localId: id);
  }

  @override
  Future<void> updateStok(int produkId, int jumlah) async {
    await (_db.update(_db.produkTable)..where((tbl) => tbl.id.equals(produkId)))
        .write(ProdukTableCompanion(stok: Value(jumlah)));
    await _syncHelper.onUpdate(tableEntity: 'produk', localId: produkId);
  }

  @override
  Future<List<domain.SatuanProduk>> getSatuanByProdukId(int produkId) async {
    final data = await (_db.select(
      _db.satuanProdukTable,
    )..where((t) => t.produkId.equals(produkId))).get();
    return data.map(_mapSatuan).toList();
  }

  @override
  Future<void> addSatuan(domain.SatuanProduk satuan) async {
    final newId = await _db
        .into(_db.satuanProdukTable)
        .insert(
          SatuanProdukTableCompanion.insert(
            produkId: satuan.produkId,
            nama: satuan.nama,
            konversi: satuan.konversi,
            hargaBeli: satuan.hargaBeli,
            hargaJual: satuan.hargaJual,
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'satuan_produk', localId: newId);
  }

  @override
  Future<void> updateSatuan(domain.SatuanProduk satuan) async {
    await (_db.update(
      _db.satuanProdukTable,
    )..where((t) => t.id.equals(satuan.id!))).write(
      SatuanProdukTableCompanion(
        nama: Value(satuan.nama),
        konversi: Value(satuan.konversi),
        hargaBeli: Value(satuan.hargaBeli),
        hargaJual: Value(satuan.hargaJual),
      ),
    );
    await _syncHelper.onUpdate(tableEntity: 'satuan_produk', localId: satuan.id!);
  }

  @override
  Future<void> deleteSatuan(int id) async {
    await (_db.delete(
      _db.satuanProdukTable,
    )..where((t) => t.id.equals(id))).go();
    await _syncHelper.onDelete(tableEntity: 'satuan_produk', localId: id);
  }

  @override
  Future<void> deleteSatuanByProdukId(int produkId) async {
    await (_db.delete(
      _db.satuanProdukTable,
    )..where((t) => t.produkId.equals(produkId))).go();
  }

  @override
  Future<({int imported, int skipped})> importAll({
    required List<domain.Produk> produkList,
    required Map<String, List<domain.SatuanProduk>> satuanByNama,
    required Set<String> existingBarcodes,
  }) async {
    int imported = 0;
    int skipped = 0;

    await _db.transaction(() async {
      for (final produk in produkList) {
        if (produk.barcode != null &&
            existingBarcodes.contains(produk.barcode)) {
          skipped++;
          continue;
        }

        final newId = await _db.into(_db.produkTable).insert(
              ProdukTableCompanion.insert(
                nama: produk.nama,
                barcode: Value(produk.barcode),
                hargaBeli: produk.hargaBeli,
                hargaJual: produk.hargaJual,
                stok: Value(produk.stok),
                kategori: Value(produk.kategori),
                satuan: Value(produk.satuan ?? 'pcs'),
              ),
            );
        await _syncHelper.onInsert(tableEntity: 'produk', localId: newId);

        final satuanList = satuanByNama[produk.nama];
        if (satuanList != null) {
          for (final satuan in satuanList) {
            final newSatuanId = await _db.into(_db.satuanProdukTable).insert(
                  SatuanProdukTableCompanion.insert(
                    produkId: newId,
                    nama: satuan.nama,
                    konversi: satuan.konversi,
                    hargaBeli: satuan.hargaBeli,
                    hargaJual: satuan.hargaJual,
                  ),
                );
            await _syncHelper.onInsert(
                tableEntity: 'satuan_produk', localId: newSatuanId);
          }
        }

        imported++;
      }
    });

    return (imported: imported, skipped: skipped);
  }
}
