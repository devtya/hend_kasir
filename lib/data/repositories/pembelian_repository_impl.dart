import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/item_pembelian.dart' as domain;
import '../../domain/entities/pembelian.dart' as domain;
import '../../domain/repositories/pembelian_repository.dart';

class PembelianRepositoryImpl implements PembelianRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  PembelianRepositoryImpl(this._db, this._syncHelper);

  domain.Pembelian _map(PembelianTableData data) {
    return domain.Pembelian(
      id: data.id,
      namaSupplier: data.namaSupplier,
      totalHarga: data.totalHarga,
      createdAt: data.createdAt,
    );
  }

  @override
  Future<List<domain.Pembelian>> getAllPembelian() async {
    final data = await _db.select(_db.pembelianTable).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_map).toList();
  }

  @override
  Future<domain.Pembelian?> getPembelianById(int id) async {
    final data = await (_db.select(
      _db.pembelianTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return data != null ? _map(data) : null;
  }

  @override
  Future<int> addPembelian(domain.Pembelian pembelian) async {
    final newId = await _db
        .into(_db.pembelianTable)
        .insert(
          PembelianTableCompanion.insert(
            namaSupplier: pembelian.namaSupplier,
            totalHarga: pembelian.totalHarga,
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'pembelian', localId: newId);
    return newId;
  }

  @override
  Future<void> addItemPembelian(domain.ItemPembelian item) async {
    final newId = await _db
        .into(_db.itemPembelianTable)
        .insert(
          ItemPembelianTableCompanion.insert(
            pembelianId: item.pembelianId,
            produkId: item.produkId,
            jumlah: item.jumlah,
            hargaBeliSatuan: item.hargaBeliSatuan,
            subtotal: item.subtotal,
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'item_pembelian', localId: newId);
  }

  @override
  Future<domain.Pembelian?> getLastPembelianByProdukId(int produkId) async {
    final query = _db.select(_db.itemPembelianTable).join([
      innerJoin(
        _db.pembelianTable,
        _db.pembelianTable.id.equalsExp(_db.itemPembelianTable.pembelianId),
      ),
      innerJoin(
        _db.produkTable,
        _db.produkTable.id.equalsExp(_db.itemPembelianTable.produkId),
      ),
    ])
      ..where(_db.itemPembelianTable.produkId.equals(produkId))
      ..orderBy([
        OrderingTerm(
          expression: _db.pembelianTable.createdAt,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(1);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final item = result.readTable(_db.itemPembelianTable);
    final pembelian = result.readTable(_db.pembelianTable);
    final produk = result.readTable(_db.produkTable);
    return domain.Pembelian(
      id: pembelian.id,
      namaSupplier: pembelian.namaSupplier,
      totalHarga: pembelian.totalHarga,
      createdAt: pembelian.createdAt,
      items: [
        domain.ItemPembelian(
          id: item.id,
          pembelianId: item.pembelianId,
          produkId: item.produkId,
          namaProduk: produk.nama,
          jumlah: item.jumlah,
          hargaBeliSatuan: item.hargaBeliSatuan,
          subtotal: item.subtotal,
        ),
      ],
    );
  }

  @override
  Future<List<domain.ItemPembelian>> getItemsByPembelianId(
    int pembelianId,
  ) async {
    final query = _db.select(_db.itemPembelianTable).join([
      innerJoin(
        _db.produkTable,
        _db.produkTable.id.equalsExp(_db.itemPembelianTable.produkId),
      ),
    ])..where(_db.itemPembelianTable.pembelianId.equals(pembelianId));

    final result = await query.get();
    return result.map((row) {
      final item = row.readTable(_db.itemPembelianTable);
      final produk = row.readTable(_db.produkTable);
      return domain.ItemPembelian(
        id: item.id,
        pembelianId: item.pembelianId,
        produkId: item.produkId,
        namaProduk: produk.nama,
        jumlah: item.jumlah,
        hargaBeliSatuan: item.hargaBeliSatuan,
        subtotal: item.subtotal,
      );
    }).toList();
  }

  @override
  Future<void> updatePembelian(domain.Pembelian pembelian) async {
    await (_db.update(_db.pembelianTable)
      ..where((t) => t.id.equals(pembelian.id!)))
      .write(PembelianTableCompanion(
        namaSupplier: Value(pembelian.namaSupplier),
        totalHarga: Value(pembelian.totalHarga),
      ));
    await _syncHelper.onUpdate(
      tableEntity: 'pembelian',
      localId: pembelian.id!,
    );
  }

  @override
  Future<void> deleteItemsByPembelianId(int pembelianId) async {
    await (_db.delete(_db.itemPembelianTable)
      ..where((t) => t.pembelianId.equals(pembelianId)))
      .go();
  }

  @override
  Future<void> deletePembelian(int id) async {
    await (_db.delete(_db.pembelianTable)
      ..where((t) => t.id.equals(id)))
      .go();
    await _syncHelper.onDelete(tableEntity: 'pembelian', localId: id);
  }
}
