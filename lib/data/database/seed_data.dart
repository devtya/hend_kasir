import 'package:drift/drift.dart';

import 'app_database.dart';

Future<void> seedDatabase(AppDatabase db) async {
  final existing = await db.select(db.produkTable).get();
  if (existing.isNotEmpty) return;

  // ── Insert products one by one to capture IDs (needed for multi-satuan) ──
  final ids = <int>[];

  for (final p in _produkData) {
    final id = await db.into(db.produkTable).insert(p);
    ids.add(id);
  }

  // ── Multi-satuan data ──
  // Masing-masing produk yang dijual dalam satuan besar (dus/karton/pak/lusin)
  // akan memiliki record di tabel satuan_produk.
  // Format: produkId, nama satuan, konversi (berapa base = 1 satuan ini),
  //         hargaBeli satuan ini, hargaJual satuan ini

  // [0] Beras Premium 5kg — satuan: SAK (base=kg, 1 SAK = 5 karung=25kg? no, single saja)
  // Beras dijual per karung saja, skip multi-satuan

  // [1] Minyak Goreng Bimoli 1L — base: BTL, tambah: KARTON (12 btl)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[1],
          nama: 'KARTON',
          konversi: 12.0,
          hargaBeli: 168000,
          hargaJual: 192000,
        ),
      );

  // [2] Gula Pasir 1kg — single satuan (kg), skip

  // [3] Telur Ayam — single satuan (kg), skip

  // [4] Indomie Goreng — base: PCS, tambah: DUS (40 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[4],
          nama: 'DUS',
          konversi: 40.0,
          hargaBeli: 104000,
          hargaJual: 140000,
        ),
      );

  // [5] Indomie Kari Ayam — base: PCS, tambah: DUS (40 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[5],
          nama: 'DUS',
          konversi: 40.0,
          hargaBeli: 104000,
          hargaJual: 140000,
        ),
      );

  // [6] Mie Sedaap Goreng — base: PCS, tambah: DUS (40 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[6],
          nama: 'DUS',
          konversi: 40.0,
          hargaBeli: 100000,
          hargaJual: 136000,
        ),
      );

  // [7] Aqua 600ml — base: BTL, tambah: DUS (24 btl)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[7],
          nama: 'DUS',
          konversi: 24.0,
          hargaBeli: 60000,
          hargaJual: 78000,
        ),
      );

  // [8] Aqua 1500ml — base: BTL, tambah: DUS (12 btl)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[8],
          nama: 'DUS',
          konversi: 12.0,
          hargaBeli: 48000,
          hargaJual: 66000,
        ),
      );

  // [9] Teh Botol Sosro 450ml — base: BTL, tambah: KRAT (24 btl)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[9],
          nama: 'KRAT',
          konversi: 24.0,
          hargaBeli: 96000,
          hargaJual: 120000,
        ),
      );

  // [10] Coca Cola 390ml — base: BTL, tambah: DUS (12 btl)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[10],
          nama: 'DUS',
          konversi: 12.0,
          hargaBeli: 54000,
          hargaJual: 72000,
        ),
      );

  // [11] Kopi Kapal Api 25g — base: SACHET, tambah: RENCENG (10 sachet)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[11],
          nama: 'RENCENG',
          konversi: 10.0,
          hargaBeli: 10000,
          hargaJual: 15000,
        ),
      );

  // [12] Good Day Cappuccino 25g — base: SACHET, tambah: RENCENG (10 sachet)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[12],
          nama: 'RENCENG',
          konversi: 10.0,
          hargaBeli: 12000,
          hargaJual: 18000,
        ),
      );

  // [13] Rokok Surya 16 — single (bungkus), skip
  // [14] Rokok Djarum Super 12 — single (bungkus), tambah: SLOP (10 bungkus)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[14],
          nama: 'SLOP',
          konversi: 10.0,
          hargaBeli: 175000,
          hargaJual: 210000,
        ),
      );

  // [15] Sabun Mandi Lifebuoy 75g — base: PCS, tambah: LUSIN (12 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[15],
          nama: 'LUSIN',
          konversi: 12.0,
          hargaBeli: 42000,
          hargaJual: 54000,
        ),
      );

  // [16] Shampo Sunsilk 9ml — base: SACHET, tambah: RENCENG (12 sachet)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[16],
          nama: 'RENCENG',
          konversi: 12.0,
          hargaBeli: 9600,
          hargaJual: 13200,
        ),
      );

  // [17] Pasta Gigi Pepsodent 75g — base: PCS, tambah: LUSIN (12 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[17],
          nama: 'LUSIN',
          konversi: 12.0,
          hargaBeli: 48000,
          hargaJual: 72000,
        ),
      );

  // [18] Kecap Manis ABC 600ml — single, skip
  // [19] Saos Sambal ABC 335ml — single, skip

  // [20] Tisu Tessa 250 sheets — base: PAK, tambah: DUS (6 pak)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[20],
          nama: 'DUS',
          konversi: 6.0,
          hargaBeli: 72000,
          hargaJual: 96000,
        ),
      );

  // [21] Deterjen Rinso 800g — base: PCS, tambah: DUS (12 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[21],
          nama: 'DUS',
          konversi: 12.0,
          hargaBeli: 120000,
          hargaJual: 156000,
        ),
      );

  // [22] Susu Ultra Milk 1L — base: PCS, tambah: DUS (12 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[22],
          nama: 'DUS',
          konversi: 12.0,
          hargaBeli: 180000,
          hargaJual: 216000,
        ),
      );

  // [23] Susu Indomilk Coklat 250ml — base: PCS, tambah: DUS (24 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[23],
          nama: 'DUS',
          konversi: 24.0,
          hargaBeli: 96000,
          hargaJual: 132000,
        ),
      );

  // [24] Baterai ABC AA — base: PCS, tambah: LUSIN (12 pcs)
  await db
      .into(db.satuanProdukTable)
      .insert(
        SatuanProdukTableCompanion.insert(
          produkId: ids[24],
          nama: 'LUSIN',
          konversi: 12.0,
          hargaBeli: 36000,
          hargaJual: 54000,
        ),
      );

  // ── Suppliers ──
  final existingSupplier = await db.select(db.supplierTable).get();
  if (existingSupplier.isNotEmpty) return;

  await db.batch((batch) {
    batch.insertAll(db.supplierTable, [
      SupplierTableCompanion.insert(
        nama: 'UD Sembako Jaya',
        telepon: Value('081234567890'),
        alamat: Value('Jl. Merdeka No. 123, Jakarta'),
      ),
      SupplierTableCompanion.insert(
        nama: 'CV Maju Makmur',
        telepon: Value('082345678901'),
        alamat: Value('Jl. Sudirman No. 45, Bandung'),
      ),
      SupplierTableCompanion.insert(
        nama: 'PT Indofood Sukses Makmur',
        telepon: Value('0800123456'),
        alamat: Value('Jl. Jend. Sudirman Kav. 76-78, Jakarta'),
      ),
      SupplierTableCompanion.insert(
        nama: 'Toko Sinar Rejeki',
        telepon: Value('085678901234'),
        alamat: Value('Jl. Diponegoro No. 67, Surabaya'),
      ),
      SupplierTableCompanion.insert(
        nama: 'CV Aqua Golden Mississippi',
        telepon: Value('081122334455'),
        alamat: Value('Jl. Raya Cibitung No. 10, Bekasi'),
      ),
      SupplierTableCompanion.insert(
        nama: 'PT Unilever Indonesia',
        telepon: Value('0800100200'),
        alamat: Value('Grha Unilever, BSD, Tangerang'),
      ),
    ]);
  });
}

List<ProdukTableCompanion> get _produkData => [
  // ════════════════════════ SEMBAKO ════════════════════════
  // [0]
  ProdukTableCompanion.insert(
    nama: 'Beras Premium 5kg',
    barcode: Value('8991002111111'),
    hargaBeli: 65000,
    hargaJual: 72000,
    stok: Value(50),
    kategori: Value('Sembako'),
    satuan: Value('karung'),
  ),
  // [1]
  ProdukTableCompanion.insert(
    nama: 'Minyak Goreng Bimoli 1L',
    barcode: Value('8991002222222'),
    hargaBeli: 14000,
    hargaJual: 16000,
    stok: Value(36),
    kategori: Value('Sembako'),
    satuan: Value('btl'),
  ),
  // [2]
  ProdukTableCompanion.insert(
    nama: 'Gula Pasir 1kg',
    barcode: Value('8991002333333'),
    hargaBeli: 15000,
    hargaJual: 17500,
    stok: Value(40),
    kategori: Value('Sembako'),
    satuan: Value('kg'),
  ),
  // [3]
  ProdukTableCompanion.insert(
    nama: 'Telur Ayam 1kg',
    barcode: Value('8991002444444'),
    hargaBeli: 25000,
    hargaJual: 28000,
    stok: Value(25),
    kategori: Value('Sembako'),
    satuan: Value('kg'),
  ),

  // ════════════════════════ MIE INSTAN ════════════════════════
  // [4]
  ProdukTableCompanion.insert(
    nama: 'Indomie Goreng',
    barcode: Value('089686010947'),
    hargaBeli: 2600,
    hargaJual: 3500,
    stok: Value(200),
    kategori: Value('Mie Instan'),
    satuan: Value('pcs'),
  ),
  // [5]
  ProdukTableCompanion.insert(
    nama: 'Indomie Kari Ayam',
    barcode: Value('089686010220'),
    hargaBeli: 2600,
    hargaJual: 3500,
    stok: Value(160),
    kategori: Value('Mie Instan'),
    satuan: Value('pcs'),
  ),
  // [6]
  ProdukTableCompanion.insert(
    nama: 'Mie Sedaap Goreng',
    barcode: Value('8998866200123'),
    hargaBeli: 2500,
    hargaJual: 3400,
    stok: Value(120),
    kategori: Value('Mie Instan'),
    satuan: Value('pcs'),
  ),

  // ════════════════════════ MINUMAN ════════════════════════
  // [7]
  ProdukTableCompanion.insert(
    nama: 'Aqua 600ml',
    barcode: Value('8886008101024'),
    hargaBeli: 2500,
    hargaJual: 3500,
    stok: Value(120),
    kategori: Value('Minuman'),
    satuan: Value('btl'),
  ),
  // [8]
  ProdukTableCompanion.insert(
    nama: 'Aqua 1500ml',
    barcode: Value('8886008101048'),
    hargaBeli: 4000,
    hargaJual: 5500,
    stok: Value(48),
    kategori: Value('Minuman'),
    satuan: Value('btl'),
  ),
  // [9]
  ProdukTableCompanion.insert(
    nama: 'Teh Botol Sosro 450ml',
    barcode: Value('8991002345678'),
    hargaBeli: 4000,
    hargaJual: 5000,
    stok: Value(72),
    kategori: Value('Minuman'),
    satuan: Value('btl'),
  ),
  // [10]
  ProdukTableCompanion.insert(
    nama: 'Coca Cola 390ml',
    barcode: Value('8888002076009'),
    hargaBeli: 4500,
    hargaJual: 6000,
    stok: Value(48),
    kategori: Value('Minuman'),
    satuan: Value('btl'),
  ),

  // ════════════════════════ KOPI & MINUMAN SACHET ════════════════════════
  // [11]
  ProdukTableCompanion.insert(
    nama: 'Kopi Kapal Api 25g',
    barcode: Value('8991002666666'),
    hargaBeli: 1000,
    hargaJual: 1500,
    stok: Value(100),
    kategori: Value('Minuman'),
    satuan: Value('sachet'),
  ),
  // [12]
  ProdukTableCompanion.insert(
    nama: 'Good Day Cappuccino 25g',
    barcode: Value('8991002777000'),
    hargaBeli: 1200,
    hargaJual: 1800,
    stok: Value(80),
    kategori: Value('Minuman'),
    satuan: Value('sachet'),
  ),

  // ════════════════════════ ROKOK ════════════════════════
  // [13]
  ProdukTableCompanion.insert(
    nama: 'Surya 16',
    barcode: Value('8999909301016'),
    hargaBeli: 22000,
    hargaJual: 25000,
    stok: Value(30),
    kategori: Value('Rokok'),
    satuan: Value('bungkus'),
  ),
  // [14]
  ProdukTableCompanion.insert(
    nama: 'Djarum Super 12',
    barcode: Value('8999909101012'),
    hargaBeli: 17500,
    hargaJual: 21000,
    stok: Value(50),
    kategori: Value('Rokok'),
    satuan: Value('bungkus'),
  ),

  // ════════════════════════ PERSONAL CARE ════════════════════════
  // [15]
  ProdukTableCompanion.insert(
    nama: 'Sabun Mandi Lifebuoy 75g',
    barcode: Value('8991002888888'),
    hargaBeli: 3500,
    hargaJual: 4500,
    stok: Value(48),
    kategori: Value('Personal Care'),
    satuan: Value('pcs'),
  ),
  // [16]
  ProdukTableCompanion.insert(
    nama: 'Shampo Sunsilk 9ml',
    barcode: Value('8991002999999'),
    hargaBeli: 800,
    hargaJual: 1100,
    stok: Value(72),
    kategori: Value('Personal Care'),
    satuan: Value('sachet'),
  ),
  // [17]
  ProdukTableCompanion.insert(
    nama: 'Pasta Gigi Pepsodent 75g',
    barcode: Value('8999999028701'),
    hargaBeli: 4000,
    hargaJual: 6000,
    stok: Value(36),
    kategori: Value('Personal Care'),
    satuan: Value('pcs'),
  ),

  // ════════════════════════ BUMBU DAPUR ════════════════════════
  // [18]
  ProdukTableCompanion.insert(
    nama: 'Kecap Manis ABC 600ml',
    barcode: Value('8991002220000'),
    hargaBeli: 12000,
    hargaJual: 15000,
    stok: Value(20),
    kategori: Value('Bumbu Dapur'),
    satuan: Value('btl'),
  ),
  // [19]
  ProdukTableCompanion.insert(
    nama: 'Saos Sambal ABC 335ml',
    barcode: Value('8991002330000'),
    hargaBeli: 8000,
    hargaJual: 10000,
    stok: Value(24),
    kategori: Value('Bumbu Dapur'),
    satuan: Value('btl'),
  ),

  // ════════════════════════ KEBUTUHAN RUMAH TANGGA ════════════════════════
  // [20]
  ProdukTableCompanion.insert(
    nama: 'Tisu Tessa 250 sheets',
    barcode: Value('8992907550250'),
    hargaBeli: 12000,
    hargaJual: 16000,
    stok: Value(18),
    kategori: Value('Rumah Tangga'),
    satuan: Value('pak'),
  ),
  // [21]
  ProdukTableCompanion.insert(
    nama: 'Deterjen Rinso 800g',
    barcode: Value('8999999017897'),
    hargaBeli: 10000,
    hargaJual: 13000,
    stok: Value(24),
    kategori: Value('Rumah Tangga'),
    satuan: Value('pcs'),
  ),

  // ════════════════════════ SUSU ════════════════════════
  // [22]
  ProdukTableCompanion.insert(
    nama: 'Susu Ultra Milk Full Cream 1L',
    barcode: Value('8998009010101'),
    hargaBeli: 15000,
    hargaJual: 18000,
    stok: Value(24),
    kategori: Value('Susu'),
    satuan: Value('pcs'),
  ),
  // [23]
  ProdukTableCompanion.insert(
    nama: 'Susu Indomilk Coklat 250ml',
    barcode: Value('8998009020202'),
    hargaBeli: 4000,
    hargaJual: 5500,
    stok: Value(48),
    kategori: Value('Susu'),
    satuan: Value('pcs'),
  ),

  // ════════════════════════ LAIN-LAIN ════════════════════════
  // [24]
  ProdukTableCompanion.insert(
    nama: 'Baterai ABC AA',
    barcode: Value('8991234560001'),
    hargaBeli: 3000,
    hargaJual: 4500,
    stok: Value(36),
    kategori: Value('Lain-Lain'),
    satuan: Value('pcs'),
  ),
];
