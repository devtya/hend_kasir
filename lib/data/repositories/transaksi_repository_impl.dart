import 'package:drift/drift.dart';

import '../../data/database/app_database.dart';
import '../../data/services/sync_helper.dart';
import '../../domain/entities/item_transaksi.dart' as domain;
import '../../domain/entities/transaksi.dart' as domain;
import '../../domain/repositories/transaksi_repository.dart';

class TransaksiRepositoryImpl implements TransaksiRepository {
  final AppDatabase _db;
  final SyncHelper _syncHelper;

  TransaksiRepositoryImpl(this._db, this._syncHelper);

  domain.Transaksi _mapTransaksi(TransaksiTableData data) {
    return domain.Transaksi(
      id: data.id,
      totalHarga: data.totalHarga,
      jumlahBayar: data.jumlahBayar,
      kembalian: data.kembalian,
      status: data.status,
      pelangganId: data.pelangganId,
      createdAt: data.createdAt,
    );
  }


  @override
  Future<List<domain.Transaksi>> getAllTransaksi() async {
    final data = await _db.select(_db.transaksiTable).get();
    data.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return data.map(_mapTransaksi).toList();
  }

  @override
  Future<List<domain.Transaksi>> getTransaksiByDate(DateTime date) async {
    final data = await _db.select(_db.transaksiTable).get();
    final filtered = data.where((t) {
      return t.createdAt.year == date.year &&
          t.createdAt.month == date.month &&
          t.createdAt.day == date.day;
    }).toList();
    filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return filtered.map(_mapTransaksi).toList();
  }

  @override
  Future<domain.Transaksi?> getTransaksiById(int id) async {
    final data = await (_db.select(
      _db.transaksiTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    if (data == null) return null;
    final items = await getItemTransaksiByTransaksiId(id);
    return _mapTransaksi(data).copyWith(items: items);
  }

  @override
  Future<int> addTransaksi(domain.Transaksi transaksi) async {
    final newId = await _db
        .into(_db.transaksiTable)
        .insert(
          TransaksiTableCompanion.insert(
            totalHarga: transaksi.totalHarga,
            jumlahBayar: transaksi.jumlahBayar,
            kembalian: transaksi.kembalian,
            status: Value(transaksi.status),
            pelangganId: Value(transaksi.pelangganId),
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'transaksi', localId: newId);
    return newId;
  }

  @override
  Future<void> addItemTransaksi(domain.ItemTransaksi item) async {
    final newId = await _db
        .into(_db.itemTransaksiTable)
        .insert(
          ItemTransaksiTableCompanion.insert(
            transaksiId: item.transaksiId,
            produkId: item.produkId,
            jumlah: item.jumlah,
            hargaSatuan: item.hargaSatuan,
            subtotal: item.subtotal,
          ),
        );
    await _syncHelper.onInsert(tableEntity: 'item_transaksi', localId: newId);
  }

  @override
  Future<List<domain.ItemTransaksi>> getItemTransaksiByTransaksiId(
    int transaksiId,
  ) async {
    final query = _db.select(_db.itemTransaksiTable).join([
      leftOuterJoin(
        _db.produkTable,
        _db.produkTable.id.equalsExp(_db.itemTransaksiTable.produkId),
      ),
    ])..where(_db.itemTransaksiTable.transaksiId.equals(transaksiId));

    final rows = await query.get();
    return rows.map((row) {
      final item = row.readTable(_db.itemTransaksiTable);
      final produk = row.readTableOrNull(_db.produkTable);
      return domain.ItemTransaksi(
        id: item.id,
        transaksiId: item.transaksiId,
        produkId: item.produkId,
        namaProduk: produk?.nama,
        jumlah: item.jumlah,
        hargaSatuan: item.hargaSatuan,
        subtotal: item.subtotal,
      );
    }).toList();
  }

  @override
  Future<domain.Transaksi?> getLastTransaksiByProdukId(int produkId) async {
    final query = _db.select(_db.itemTransaksiTable).join([
      innerJoin(
        _db.transaksiTable,
        _db.transaksiTable.id.equalsExp(_db.itemTransaksiTable.transaksiId),
      ),
      innerJoin(
        _db.produkTable,
        _db.produkTable.id.equalsExp(_db.itemTransaksiTable.produkId),
      ),
    ])
      ..where(_db.itemTransaksiTable.produkId.equals(produkId))
      ..orderBy([
        OrderingTerm(
          expression: _db.transaksiTable.createdAt,
          mode: OrderingMode.desc,
        ),
      ])
      ..limit(1);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final item = result.readTable(_db.itemTransaksiTable);
    final transaksi = result.readTable(_db.transaksiTable);
    final produk = result.readTable(_db.produkTable);
    return domain.Transaksi(
      id: transaksi.id,
      totalHarga: transaksi.totalHarga,
      jumlahBayar: transaksi.jumlahBayar,
      kembalian: transaksi.kembalian,
      status: transaksi.status,
      pelangganId: transaksi.pelangganId,
      createdAt: transaksi.createdAt,
      items: [
        domain.ItemTransaksi(
          id: item.id,
          transaksiId: item.transaksiId,
          produkId: item.produkId,
          namaProduk: produk.nama,
          jumlah: item.jumlah,
          hargaSatuan: item.hargaSatuan,
          subtotal: item.subtotal,
        ),
      ],
    );
  }

  @override
  Future<double> getTotalOmsetToday() async {
    final data = await _db.select(_db.transaksiTable).get();
    final now = DateTime.now();
    final today = data.where((t) {
      return t.createdAt.year == now.year &&
          t.createdAt.month == now.month &&
          t.createdAt.day == now.day &&
          t.status == 'lunas';
    });
    double total = 0;
    for (final t in today) {
      total += t.totalHarga;
    }
    return total;
  }
}
