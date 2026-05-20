// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProdukTableTable extends ProdukTable
    with TableInfo<$ProdukTableTable, ProdukTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProdukTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _barcodeMeta = const VerificationMeta(
    'barcode',
  );
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
    'barcode',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hargaBeliMeta = const VerificationMeta(
    'hargaBeli',
  );
  @override
  late final GeneratedColumn<double> hargaBeli = GeneratedColumn<double>(
    'harga_beli',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaJualMeta = const VerificationMeta(
    'hargaJual',
  );
  @override
  late final GeneratedColumn<double> hargaJual = GeneratedColumn<double>(
    'harga_jual',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stokMeta = const VerificationMeta('stok');
  @override
  late final GeneratedColumn<int> stok = GeneratedColumn<int>(
    'stok',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _kategoriMeta = const VerificationMeta(
    'kategori',
  );
  @override
  late final GeneratedColumn<String> kategori = GeneratedColumn<String>(
    'kategori',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _satuanMeta = const VerificationMeta('satuan');
  @override
  late final GeneratedColumn<String> satuan = GeneratedColumn<String>(
    'satuan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pcs'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nama,
    barcode,
    hargaBeli,
    hargaJual,
    stok,
    kategori,
    satuan,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'produk_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProdukTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('barcode')) {
      context.handle(
        _barcodeMeta,
        barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta),
      );
    }
    if (data.containsKey('harga_beli')) {
      context.handle(
        _hargaBeliMeta,
        hargaBeli.isAcceptableOrUnknown(data['harga_beli']!, _hargaBeliMeta),
      );
    } else if (isInserting) {
      context.missing(_hargaBeliMeta);
    }
    if (data.containsKey('harga_jual')) {
      context.handle(
        _hargaJualMeta,
        hargaJual.isAcceptableOrUnknown(data['harga_jual']!, _hargaJualMeta),
      );
    } else if (isInserting) {
      context.missing(_hargaJualMeta);
    }
    if (data.containsKey('stok')) {
      context.handle(
        _stokMeta,
        stok.isAcceptableOrUnknown(data['stok']!, _stokMeta),
      );
    }
    if (data.containsKey('kategori')) {
      context.handle(
        _kategoriMeta,
        kategori.isAcceptableOrUnknown(data['kategori']!, _kategoriMeta),
      );
    }
    if (data.containsKey('satuan')) {
      context.handle(
        _satuanMeta,
        satuan.isAcceptableOrUnknown(data['satuan']!, _satuanMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProdukTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProdukTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      barcode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}barcode'],
      ),
      hargaBeli: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_beli'],
      )!,
      hargaJual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_jual'],
      )!,
      stok: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stok'],
      )!,
      kategori: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kategori'],
      ),
      satuan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}satuan'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProdukTableTable createAlias(String alias) {
    return $ProdukTableTable(attachedDatabase, alias);
  }
}

class ProdukTableData extends DataClass implements Insertable<ProdukTableData> {
  final int id;
  final String nama;
  final String? barcode;
  final double hargaBeli;
  final double hargaJual;
  final int stok;
  final String? kategori;
  final String satuan;
  final DateTime createdAt;
  const ProdukTableData({
    required this.id,
    required this.nama,
    this.barcode,
    required this.hargaBeli,
    required this.hargaJual,
    required this.stok,
    this.kategori,
    required this.satuan,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    map['harga_beli'] = Variable<double>(hargaBeli);
    map['harga_jual'] = Variable<double>(hargaJual);
    map['stok'] = Variable<int>(stok);
    if (!nullToAbsent || kategori != null) {
      map['kategori'] = Variable<String>(kategori);
    }
    map['satuan'] = Variable<String>(satuan);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ProdukTableCompanion toCompanion(bool nullToAbsent) {
    return ProdukTableCompanion(
      id: Value(id),
      nama: Value(nama),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      hargaBeli: Value(hargaBeli),
      hargaJual: Value(hargaJual),
      stok: Value(stok),
      kategori: kategori == null && nullToAbsent
          ? const Value.absent()
          : Value(kategori),
      satuan: Value(satuan),
      createdAt: Value(createdAt),
    );
  }

  factory ProdukTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProdukTableData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      hargaBeli: serializer.fromJson<double>(json['hargaBeli']),
      hargaJual: serializer.fromJson<double>(json['hargaJual']),
      stok: serializer.fromJson<int>(json['stok']),
      kategori: serializer.fromJson<String?>(json['kategori']),
      satuan: serializer.fromJson<String>(json['satuan']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'barcode': serializer.toJson<String?>(barcode),
      'hargaBeli': serializer.toJson<double>(hargaBeli),
      'hargaJual': serializer.toJson<double>(hargaJual),
      'stok': serializer.toJson<int>(stok),
      'kategori': serializer.toJson<String?>(kategori),
      'satuan': serializer.toJson<String>(satuan),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ProdukTableData copyWith({
    int? id,
    String? nama,
    Value<String?> barcode = const Value.absent(),
    double? hargaBeli,
    double? hargaJual,
    int? stok,
    Value<String?> kategori = const Value.absent(),
    String? satuan,
    DateTime? createdAt,
  }) => ProdukTableData(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    barcode: barcode.present ? barcode.value : this.barcode,
    hargaBeli: hargaBeli ?? this.hargaBeli,
    hargaJual: hargaJual ?? this.hargaJual,
    stok: stok ?? this.stok,
    kategori: kategori.present ? kategori.value : this.kategori,
    satuan: satuan ?? this.satuan,
    createdAt: createdAt ?? this.createdAt,
  );
  ProdukTableData copyWithCompanion(ProdukTableCompanion data) {
    return ProdukTableData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      hargaBeli: data.hargaBeli.present ? data.hargaBeli.value : this.hargaBeli,
      hargaJual: data.hargaJual.present ? data.hargaJual.value : this.hargaJual,
      stok: data.stok.present ? data.stok.value : this.stok,
      kategori: data.kategori.present ? data.kategori.value : this.kategori,
      satuan: data.satuan.present ? data.satuan.value : this.satuan,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProdukTableData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('barcode: $barcode, ')
          ..write('hargaBeli: $hargaBeli, ')
          ..write('hargaJual: $hargaJual, ')
          ..write('stok: $stok, ')
          ..write('kategori: $kategori, ')
          ..write('satuan: $satuan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nama,
    barcode,
    hargaBeli,
    hargaJual,
    stok,
    kategori,
    satuan,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProdukTableData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.barcode == this.barcode &&
          other.hargaBeli == this.hargaBeli &&
          other.hargaJual == this.hargaJual &&
          other.stok == this.stok &&
          other.kategori == this.kategori &&
          other.satuan == this.satuan &&
          other.createdAt == this.createdAt);
}

class ProdukTableCompanion extends UpdateCompanion<ProdukTableData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String?> barcode;
  final Value<double> hargaBeli;
  final Value<double> hargaJual;
  final Value<int> stok;
  final Value<String?> kategori;
  final Value<String> satuan;
  final Value<DateTime> createdAt;
  const ProdukTableCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.barcode = const Value.absent(),
    this.hargaBeli = const Value.absent(),
    this.hargaJual = const Value.absent(),
    this.stok = const Value.absent(),
    this.kategori = const Value.absent(),
    this.satuan = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ProdukTableCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.barcode = const Value.absent(),
    required double hargaBeli,
    required double hargaJual,
    this.stok = const Value.absent(),
    this.kategori = const Value.absent(),
    this.satuan = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : nama = Value(nama),
       hargaBeli = Value(hargaBeli),
       hargaJual = Value(hargaJual);
  static Insertable<ProdukTableData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? barcode,
    Expression<double>? hargaBeli,
    Expression<double>? hargaJual,
    Expression<int>? stok,
    Expression<String>? kategori,
    Expression<String>? satuan,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (barcode != null) 'barcode': barcode,
      if (hargaBeli != null) 'harga_beli': hargaBeli,
      if (hargaJual != null) 'harga_jual': hargaJual,
      if (stok != null) 'stok': stok,
      if (kategori != null) 'kategori': kategori,
      if (satuan != null) 'satuan': satuan,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ProdukTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nama,
    Value<String?>? barcode,
    Value<double>? hargaBeli,
    Value<double>? hargaJual,
    Value<int>? stok,
    Value<String?>? kategori,
    Value<String>? satuan,
    Value<DateTime>? createdAt,
  }) {
    return ProdukTableCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      barcode: barcode ?? this.barcode,
      hargaBeli: hargaBeli ?? this.hargaBeli,
      hargaJual: hargaJual ?? this.hargaJual,
      stok: stok ?? this.stok,
      kategori: kategori ?? this.kategori,
      satuan: satuan ?? this.satuan,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (hargaBeli.present) {
      map['harga_beli'] = Variable<double>(hargaBeli.value);
    }
    if (hargaJual.present) {
      map['harga_jual'] = Variable<double>(hargaJual.value);
    }
    if (stok.present) {
      map['stok'] = Variable<int>(stok.value);
    }
    if (kategori.present) {
      map['kategori'] = Variable<String>(kategori.value);
    }
    if (satuan.present) {
      map['satuan'] = Variable<String>(satuan.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProdukTableCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('barcode: $barcode, ')
          ..write('hargaBeli: $hargaBeli, ')
          ..write('hargaJual: $hargaJual, ')
          ..write('stok: $stok, ')
          ..write('kategori: $kategori, ')
          ..write('satuan: $satuan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SatuanProdukTableTable extends SatuanProdukTable
    with TableInfo<$SatuanProdukTableTable, SatuanProdukTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SatuanProdukTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _konversiMeta = const VerificationMeta(
    'konversi',
  );
  @override
  late final GeneratedColumn<double> konversi = GeneratedColumn<double>(
    'konversi',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaBeliMeta = const VerificationMeta(
    'hargaBeli',
  );
  @override
  late final GeneratedColumn<double> hargaBeli = GeneratedColumn<double>(
    'harga_beli',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaJualMeta = const VerificationMeta(
    'hargaJual',
  );
  @override
  late final GeneratedColumn<double> hargaJual = GeneratedColumn<double>(
    'harga_jual',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    produkId,
    nama,
    konversi,
    hargaBeli,
    hargaJual,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'satuan_produk_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SatuanProdukTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('konversi')) {
      context.handle(
        _konversiMeta,
        konversi.isAcceptableOrUnknown(data['konversi']!, _konversiMeta),
      );
    } else if (isInserting) {
      context.missing(_konversiMeta);
    }
    if (data.containsKey('harga_beli')) {
      context.handle(
        _hargaBeliMeta,
        hargaBeli.isAcceptableOrUnknown(data['harga_beli']!, _hargaBeliMeta),
      );
    } else if (isInserting) {
      context.missing(_hargaBeliMeta);
    }
    if (data.containsKey('harga_jual')) {
      context.handle(
        _hargaJualMeta,
        hargaJual.isAcceptableOrUnknown(data['harga_jual']!, _hargaJualMeta),
      );
    } else if (isInserting) {
      context.missing(_hargaJualMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SatuanProdukTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SatuanProdukTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      konversi: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}konversi'],
      )!,
      hargaBeli: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_beli'],
      )!,
      hargaJual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_jual'],
      )!,
    );
  }

  @override
  $SatuanProdukTableTable createAlias(String alias) {
    return $SatuanProdukTableTable(attachedDatabase, alias);
  }
}

class SatuanProdukTableData extends DataClass
    implements Insertable<SatuanProdukTableData> {
  final int id;
  final int produkId;
  final String nama;
  final double konversi;
  final double hargaBeli;
  final double hargaJual;
  const SatuanProdukTableData({
    required this.id,
    required this.produkId,
    required this.nama,
    required this.konversi,
    required this.hargaBeli,
    required this.hargaJual,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['produk_id'] = Variable<int>(produkId);
    map['nama'] = Variable<String>(nama);
    map['konversi'] = Variable<double>(konversi);
    map['harga_beli'] = Variable<double>(hargaBeli);
    map['harga_jual'] = Variable<double>(hargaJual);
    return map;
  }

  SatuanProdukTableCompanion toCompanion(bool nullToAbsent) {
    return SatuanProdukTableCompanion(
      id: Value(id),
      produkId: Value(produkId),
      nama: Value(nama),
      konversi: Value(konversi),
      hargaBeli: Value(hargaBeli),
      hargaJual: Value(hargaJual),
    );
  }

  factory SatuanProdukTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SatuanProdukTableData(
      id: serializer.fromJson<int>(json['id']),
      produkId: serializer.fromJson<int>(json['produkId']),
      nama: serializer.fromJson<String>(json['nama']),
      konversi: serializer.fromJson<double>(json['konversi']),
      hargaBeli: serializer.fromJson<double>(json['hargaBeli']),
      hargaJual: serializer.fromJson<double>(json['hargaJual']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'produkId': serializer.toJson<int>(produkId),
      'nama': serializer.toJson<String>(nama),
      'konversi': serializer.toJson<double>(konversi),
      'hargaBeli': serializer.toJson<double>(hargaBeli),
      'hargaJual': serializer.toJson<double>(hargaJual),
    };
  }

  SatuanProdukTableData copyWith({
    int? id,
    int? produkId,
    String? nama,
    double? konversi,
    double? hargaBeli,
    double? hargaJual,
  }) => SatuanProdukTableData(
    id: id ?? this.id,
    produkId: produkId ?? this.produkId,
    nama: nama ?? this.nama,
    konversi: konversi ?? this.konversi,
    hargaBeli: hargaBeli ?? this.hargaBeli,
    hargaJual: hargaJual ?? this.hargaJual,
  );
  SatuanProdukTableData copyWithCompanion(SatuanProdukTableCompanion data) {
    return SatuanProdukTableData(
      id: data.id.present ? data.id.value : this.id,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      nama: data.nama.present ? data.nama.value : this.nama,
      konversi: data.konversi.present ? data.konversi.value : this.konversi,
      hargaBeli: data.hargaBeli.present ? data.hargaBeli.value : this.hargaBeli,
      hargaJual: data.hargaJual.present ? data.hargaJual.value : this.hargaJual,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SatuanProdukTableData(')
          ..write('id: $id, ')
          ..write('produkId: $produkId, ')
          ..write('nama: $nama, ')
          ..write('konversi: $konversi, ')
          ..write('hargaBeli: $hargaBeli, ')
          ..write('hargaJual: $hargaJual')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, produkId, nama, konversi, hargaBeli, hargaJual);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SatuanProdukTableData &&
          other.id == this.id &&
          other.produkId == this.produkId &&
          other.nama == this.nama &&
          other.konversi == this.konversi &&
          other.hargaBeli == this.hargaBeli &&
          other.hargaJual == this.hargaJual);
}

class SatuanProdukTableCompanion
    extends UpdateCompanion<SatuanProdukTableData> {
  final Value<int> id;
  final Value<int> produkId;
  final Value<String> nama;
  final Value<double> konversi;
  final Value<double> hargaBeli;
  final Value<double> hargaJual;
  const SatuanProdukTableCompanion({
    this.id = const Value.absent(),
    this.produkId = const Value.absent(),
    this.nama = const Value.absent(),
    this.konversi = const Value.absent(),
    this.hargaBeli = const Value.absent(),
    this.hargaJual = const Value.absent(),
  });
  SatuanProdukTableCompanion.insert({
    this.id = const Value.absent(),
    required int produkId,
    required String nama,
    required double konversi,
    required double hargaBeli,
    required double hargaJual,
  }) : produkId = Value(produkId),
       nama = Value(nama),
       konversi = Value(konversi),
       hargaBeli = Value(hargaBeli),
       hargaJual = Value(hargaJual);
  static Insertable<SatuanProdukTableData> custom({
    Expression<int>? id,
    Expression<int>? produkId,
    Expression<String>? nama,
    Expression<double>? konversi,
    Expression<double>? hargaBeli,
    Expression<double>? hargaJual,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (produkId != null) 'produk_id': produkId,
      if (nama != null) 'nama': nama,
      if (konversi != null) 'konversi': konversi,
      if (hargaBeli != null) 'harga_beli': hargaBeli,
      if (hargaJual != null) 'harga_jual': hargaJual,
    });
  }

  SatuanProdukTableCompanion copyWith({
    Value<int>? id,
    Value<int>? produkId,
    Value<String>? nama,
    Value<double>? konversi,
    Value<double>? hargaBeli,
    Value<double>? hargaJual,
  }) {
    return SatuanProdukTableCompanion(
      id: id ?? this.id,
      produkId: produkId ?? this.produkId,
      nama: nama ?? this.nama,
      konversi: konversi ?? this.konversi,
      hargaBeli: hargaBeli ?? this.hargaBeli,
      hargaJual: hargaJual ?? this.hargaJual,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (konversi.present) {
      map['konversi'] = Variable<double>(konversi.value);
    }
    if (hargaBeli.present) {
      map['harga_beli'] = Variable<double>(hargaBeli.value);
    }
    if (hargaJual.present) {
      map['harga_jual'] = Variable<double>(hargaJual.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SatuanProdukTableCompanion(')
          ..write('id: $id, ')
          ..write('produkId: $produkId, ')
          ..write('nama: $nama, ')
          ..write('konversi: $konversi, ')
          ..write('hargaBeli: $hargaBeli, ')
          ..write('hargaJual: $hargaJual')
          ..write(')'))
        .toString();
  }
}

class $TransaksiTableTable extends TransaksiTable
    with TableInfo<$TransaksiTableTable, TransaksiTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransaksiTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _totalHargaMeta = const VerificationMeta(
    'totalHarga',
  );
  @override
  late final GeneratedColumn<double> totalHarga = GeneratedColumn<double>(
    'total_harga',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahBayarMeta = const VerificationMeta(
    'jumlahBayar',
  );
  @override
  late final GeneratedColumn<double> jumlahBayar = GeneratedColumn<double>(
    'jumlah_bayar',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _kembalianMeta = const VerificationMeta(
    'kembalian',
  );
  @override
  late final GeneratedColumn<double> kembalian = GeneratedColumn<double>(
    'kembalian',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('lunas'),
  );
  static const VerificationMeta _pelangganIdMeta = const VerificationMeta(
    'pelangganId',
  );
  @override
  late final GeneratedColumn<int> pelangganId = GeneratedColumn<int>(
    'pelanggan_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    totalHarga,
    jumlahBayar,
    kembalian,
    status,
    pelangganId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transaksi_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TransaksiTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('total_harga')) {
      context.handle(
        _totalHargaMeta,
        totalHarga.isAcceptableOrUnknown(data['total_harga']!, _totalHargaMeta),
      );
    } else if (isInserting) {
      context.missing(_totalHargaMeta);
    }
    if (data.containsKey('jumlah_bayar')) {
      context.handle(
        _jumlahBayarMeta,
        jumlahBayar.isAcceptableOrUnknown(
          data['jumlah_bayar']!,
          _jumlahBayarMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jumlahBayarMeta);
    }
    if (data.containsKey('kembalian')) {
      context.handle(
        _kembalianMeta,
        kembalian.isAcceptableOrUnknown(data['kembalian']!, _kembalianMeta),
      );
    } else if (isInserting) {
      context.missing(_kembalianMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('pelanggan_id')) {
      context.handle(
        _pelangganIdMeta,
        pelangganId.isAcceptableOrUnknown(
          data['pelanggan_id']!,
          _pelangganIdMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TransaksiTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TransaksiTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      totalHarga: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_harga'],
      )!,
      jumlahBayar: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}jumlah_bayar'],
      )!,
      kembalian: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kembalian'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      pelangganId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pelanggan_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TransaksiTableTable createAlias(String alias) {
    return $TransaksiTableTable(attachedDatabase, alias);
  }
}

class TransaksiTableData extends DataClass
    implements Insertable<TransaksiTableData> {
  final int id;
  final double totalHarga;
  final double jumlahBayar;
  final double kembalian;
  final String status;
  final int? pelangganId;
  final DateTime createdAt;
  const TransaksiTableData({
    required this.id,
    required this.totalHarga,
    required this.jumlahBayar,
    required this.kembalian,
    required this.status,
    this.pelangganId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['total_harga'] = Variable<double>(totalHarga);
    map['jumlah_bayar'] = Variable<double>(jumlahBayar);
    map['kembalian'] = Variable<double>(kembalian);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || pelangganId != null) {
      map['pelanggan_id'] = Variable<int>(pelangganId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TransaksiTableCompanion toCompanion(bool nullToAbsent) {
    return TransaksiTableCompanion(
      id: Value(id),
      totalHarga: Value(totalHarga),
      jumlahBayar: Value(jumlahBayar),
      kembalian: Value(kembalian),
      status: Value(status),
      pelangganId: pelangganId == null && nullToAbsent
          ? const Value.absent()
          : Value(pelangganId),
      createdAt: Value(createdAt),
    );
  }

  factory TransaksiTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TransaksiTableData(
      id: serializer.fromJson<int>(json['id']),
      totalHarga: serializer.fromJson<double>(json['totalHarga']),
      jumlahBayar: serializer.fromJson<double>(json['jumlahBayar']),
      kembalian: serializer.fromJson<double>(json['kembalian']),
      status: serializer.fromJson<String>(json['status']),
      pelangganId: serializer.fromJson<int?>(json['pelangganId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'totalHarga': serializer.toJson<double>(totalHarga),
      'jumlahBayar': serializer.toJson<double>(jumlahBayar),
      'kembalian': serializer.toJson<double>(kembalian),
      'status': serializer.toJson<String>(status),
      'pelangganId': serializer.toJson<int?>(pelangganId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TransaksiTableData copyWith({
    int? id,
    double? totalHarga,
    double? jumlahBayar,
    double? kembalian,
    String? status,
    Value<int?> pelangganId = const Value.absent(),
    DateTime? createdAt,
  }) => TransaksiTableData(
    id: id ?? this.id,
    totalHarga: totalHarga ?? this.totalHarga,
    jumlahBayar: jumlahBayar ?? this.jumlahBayar,
    kembalian: kembalian ?? this.kembalian,
    status: status ?? this.status,
    pelangganId: pelangganId.present ? pelangganId.value : this.pelangganId,
    createdAt: createdAt ?? this.createdAt,
  );
  TransaksiTableData copyWithCompanion(TransaksiTableCompanion data) {
    return TransaksiTableData(
      id: data.id.present ? data.id.value : this.id,
      totalHarga: data.totalHarga.present
          ? data.totalHarga.value
          : this.totalHarga,
      jumlahBayar: data.jumlahBayar.present
          ? data.jumlahBayar.value
          : this.jumlahBayar,
      kembalian: data.kembalian.present ? data.kembalian.value : this.kembalian,
      status: data.status.present ? data.status.value : this.status,
      pelangganId: data.pelangganId.present
          ? data.pelangganId.value
          : this.pelangganId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TransaksiTableData(')
          ..write('id: $id, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('jumlahBayar: $jumlahBayar, ')
          ..write('kembalian: $kembalian, ')
          ..write('status: $status, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    totalHarga,
    jumlahBayar,
    kembalian,
    status,
    pelangganId,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TransaksiTableData &&
          other.id == this.id &&
          other.totalHarga == this.totalHarga &&
          other.jumlahBayar == this.jumlahBayar &&
          other.kembalian == this.kembalian &&
          other.status == this.status &&
          other.pelangganId == this.pelangganId &&
          other.createdAt == this.createdAt);
}

class TransaksiTableCompanion extends UpdateCompanion<TransaksiTableData> {
  final Value<int> id;
  final Value<double> totalHarga;
  final Value<double> jumlahBayar;
  final Value<double> kembalian;
  final Value<String> status;
  final Value<int?> pelangganId;
  final Value<DateTime> createdAt;
  const TransaksiTableCompanion({
    this.id = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.jumlahBayar = const Value.absent(),
    this.kembalian = const Value.absent(),
    this.status = const Value.absent(),
    this.pelangganId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TransaksiTableCompanion.insert({
    this.id = const Value.absent(),
    required double totalHarga,
    required double jumlahBayar,
    required double kembalian,
    this.status = const Value.absent(),
    this.pelangganId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : totalHarga = Value(totalHarga),
       jumlahBayar = Value(jumlahBayar),
       kembalian = Value(kembalian);
  static Insertable<TransaksiTableData> custom({
    Expression<int>? id,
    Expression<double>? totalHarga,
    Expression<double>? jumlahBayar,
    Expression<double>? kembalian,
    Expression<String>? status,
    Expression<int>? pelangganId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (totalHarga != null) 'total_harga': totalHarga,
      if (jumlahBayar != null) 'jumlah_bayar': jumlahBayar,
      if (kembalian != null) 'kembalian': kembalian,
      if (status != null) 'status': status,
      if (pelangganId != null) 'pelanggan_id': pelangganId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TransaksiTableCompanion copyWith({
    Value<int>? id,
    Value<double>? totalHarga,
    Value<double>? jumlahBayar,
    Value<double>? kembalian,
    Value<String>? status,
    Value<int?>? pelangganId,
    Value<DateTime>? createdAt,
  }) {
    return TransaksiTableCompanion(
      id: id ?? this.id,
      totalHarga: totalHarga ?? this.totalHarga,
      jumlahBayar: jumlahBayar ?? this.jumlahBayar,
      kembalian: kembalian ?? this.kembalian,
      status: status ?? this.status,
      pelangganId: pelangganId ?? this.pelangganId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (totalHarga.present) {
      map['total_harga'] = Variable<double>(totalHarga.value);
    }
    if (jumlahBayar.present) {
      map['jumlah_bayar'] = Variable<double>(jumlahBayar.value);
    }
    if (kembalian.present) {
      map['kembalian'] = Variable<double>(kembalian.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (pelangganId.present) {
      map['pelanggan_id'] = Variable<int>(pelangganId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransaksiTableCompanion(')
          ..write('id: $id, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('jumlahBayar: $jumlahBayar, ')
          ..write('kembalian: $kembalian, ')
          ..write('status: $status, ')
          ..write('pelangganId: $pelangganId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ItemTransaksiTableTable extends ItemTransaksiTable
    with TableInfo<$ItemTransaksiTableTable, ItemTransaksiTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemTransaksiTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transaksiIdMeta = const VerificationMeta(
    'transaksiId',
  );
  @override
  late final GeneratedColumn<int> transaksiId = GeneratedColumn<int>(
    'transaksi_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaSatuanMeta = const VerificationMeta(
    'hargaSatuan',
  );
  @override
  late final GeneratedColumn<double> hargaSatuan = GeneratedColumn<double>(
    'harga_satuan',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transaksiId,
    produkId,
    jumlah,
    hargaSatuan,
    subtotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_transaksi_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemTransaksiTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaksi_id')) {
      context.handle(
        _transaksiIdMeta,
        transaksiId.isAcceptableOrUnknown(
          data['transaksi_id']!,
          _transaksiIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_transaksiIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('harga_satuan')) {
      context.handle(
        _hargaSatuanMeta,
        hargaSatuan.isAcceptableOrUnknown(
          data['harga_satuan']!,
          _hargaSatuanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaSatuanMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemTransaksiTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemTransaksiTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transaksiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaksi_id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      hargaSatuan: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_satuan'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
    );
  }

  @override
  $ItemTransaksiTableTable createAlias(String alias) {
    return $ItemTransaksiTableTable(attachedDatabase, alias);
  }
}

class ItemTransaksiTableData extends DataClass
    implements Insertable<ItemTransaksiTableData> {
  final int id;
  final int transaksiId;
  final int produkId;
  final int jumlah;
  final double hargaSatuan;
  final double subtotal;
  const ItemTransaksiTableData({
    required this.id,
    required this.transaksiId,
    required this.produkId,
    required this.jumlah,
    required this.hargaSatuan,
    required this.subtotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['transaksi_id'] = Variable<int>(transaksiId);
    map['produk_id'] = Variable<int>(produkId);
    map['jumlah'] = Variable<int>(jumlah);
    map['harga_satuan'] = Variable<double>(hargaSatuan);
    map['subtotal'] = Variable<double>(subtotal);
    return map;
  }

  ItemTransaksiTableCompanion toCompanion(bool nullToAbsent) {
    return ItemTransaksiTableCompanion(
      id: Value(id),
      transaksiId: Value(transaksiId),
      produkId: Value(produkId),
      jumlah: Value(jumlah),
      hargaSatuan: Value(hargaSatuan),
      subtotal: Value(subtotal),
    );
  }

  factory ItemTransaksiTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemTransaksiTableData(
      id: serializer.fromJson<int>(json['id']),
      transaksiId: serializer.fromJson<int>(json['transaksiId']),
      produkId: serializer.fromJson<int>(json['produkId']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      hargaSatuan: serializer.fromJson<double>(json['hargaSatuan']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transaksiId': serializer.toJson<int>(transaksiId),
      'produkId': serializer.toJson<int>(produkId),
      'jumlah': serializer.toJson<int>(jumlah),
      'hargaSatuan': serializer.toJson<double>(hargaSatuan),
      'subtotal': serializer.toJson<double>(subtotal),
    };
  }

  ItemTransaksiTableData copyWith({
    int? id,
    int? transaksiId,
    int? produkId,
    int? jumlah,
    double? hargaSatuan,
    double? subtotal,
  }) => ItemTransaksiTableData(
    id: id ?? this.id,
    transaksiId: transaksiId ?? this.transaksiId,
    produkId: produkId ?? this.produkId,
    jumlah: jumlah ?? this.jumlah,
    hargaSatuan: hargaSatuan ?? this.hargaSatuan,
    subtotal: subtotal ?? this.subtotal,
  );
  ItemTransaksiTableData copyWithCompanion(ItemTransaksiTableCompanion data) {
    return ItemTransaksiTableData(
      id: data.id.present ? data.id.value : this.id,
      transaksiId: data.transaksiId.present
          ? data.transaksiId.value
          : this.transaksiId,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      hargaSatuan: data.hargaSatuan.present
          ? data.hargaSatuan.value
          : this.hargaSatuan,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemTransaksiTableData(')
          ..write('id: $id, ')
          ..write('transaksiId: $transaksiId, ')
          ..write('produkId: $produkId, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaSatuan: $hargaSatuan, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, transaksiId, produkId, jumlah, hargaSatuan, subtotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemTransaksiTableData &&
          other.id == this.id &&
          other.transaksiId == this.transaksiId &&
          other.produkId == this.produkId &&
          other.jumlah == this.jumlah &&
          other.hargaSatuan == this.hargaSatuan &&
          other.subtotal == this.subtotal);
}

class ItemTransaksiTableCompanion
    extends UpdateCompanion<ItemTransaksiTableData> {
  final Value<int> id;
  final Value<int> transaksiId;
  final Value<int> produkId;
  final Value<int> jumlah;
  final Value<double> hargaSatuan;
  final Value<double> subtotal;
  const ItemTransaksiTableCompanion({
    this.id = const Value.absent(),
    this.transaksiId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.hargaSatuan = const Value.absent(),
    this.subtotal = const Value.absent(),
  });
  ItemTransaksiTableCompanion.insert({
    this.id = const Value.absent(),
    required int transaksiId,
    required int produkId,
    required int jumlah,
    required double hargaSatuan,
    required double subtotal,
  }) : transaksiId = Value(transaksiId),
       produkId = Value(produkId),
       jumlah = Value(jumlah),
       hargaSatuan = Value(hargaSatuan),
       subtotal = Value(subtotal);
  static Insertable<ItemTransaksiTableData> custom({
    Expression<int>? id,
    Expression<int>? transaksiId,
    Expression<int>? produkId,
    Expression<int>? jumlah,
    Expression<double>? hargaSatuan,
    Expression<double>? subtotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transaksiId != null) 'transaksi_id': transaksiId,
      if (produkId != null) 'produk_id': produkId,
      if (jumlah != null) 'jumlah': jumlah,
      if (hargaSatuan != null) 'harga_satuan': hargaSatuan,
      if (subtotal != null) 'subtotal': subtotal,
    });
  }

  ItemTransaksiTableCompanion copyWith({
    Value<int>? id,
    Value<int>? transaksiId,
    Value<int>? produkId,
    Value<int>? jumlah,
    Value<double>? hargaSatuan,
    Value<double>? subtotal,
  }) {
    return ItemTransaksiTableCompanion(
      id: id ?? this.id,
      transaksiId: transaksiId ?? this.transaksiId,
      produkId: produkId ?? this.produkId,
      jumlah: jumlah ?? this.jumlah,
      hargaSatuan: hargaSatuan ?? this.hargaSatuan,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transaksiId.present) {
      map['transaksi_id'] = Variable<int>(transaksiId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (hargaSatuan.present) {
      map['harga_satuan'] = Variable<double>(hargaSatuan.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemTransaksiTableCompanion(')
          ..write('id: $id, ')
          ..write('transaksiId: $transaksiId, ')
          ..write('produkId: $produkId, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaSatuan: $hargaSatuan, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }
}

class $HutangPiutangTableTable extends HutangPiutangTable
    with TableInfo<$HutangPiutangTableTable, HutangPiutangTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HutangPiutangTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _transaksiIdMeta = const VerificationMeta(
    'transaksiId',
  );
  @override
  late final GeneratedColumn<int> transaksiId = GeneratedColumn<int>(
    'transaksi_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _namaPelangganMeta = const VerificationMeta(
    'namaPelanggan',
  );
  @override
  late final GeneratedColumn<String> namaPelanggan = GeneratedColumn<String>(
    'nama_pelanggan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<double> jumlah = GeneratedColumn<double>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('belum_lunas'),
  );
  static const VerificationMeta _tanggalJatuhTempoMeta = const VerificationMeta(
    'tanggalJatuhTempo',
  );
  @override
  late final GeneratedColumn<DateTime> tanggalJatuhTempo =
      GeneratedColumn<DateTime>(
        'tanggal_jatuh_tempo',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    transaksiId,
    namaPelanggan,
    jumlah,
    status,
    tanggalJatuhTempo,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hutang_piutang_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HutangPiutangTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('transaksi_id')) {
      context.handle(
        _transaksiIdMeta,
        transaksiId.isAcceptableOrUnknown(
          data['transaksi_id']!,
          _transaksiIdMeta,
        ),
      );
    }
    if (data.containsKey('nama_pelanggan')) {
      context.handle(
        _namaPelangganMeta,
        namaPelanggan.isAcceptableOrUnknown(
          data['nama_pelanggan']!,
          _namaPelangganMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaPelangganMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('tanggal_jatuh_tempo')) {
      context.handle(
        _tanggalJatuhTempoMeta,
        tanggalJatuhTempo.isAcceptableOrUnknown(
          data['tanggal_jatuh_tempo']!,
          _tanggalJatuhTempoMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HutangPiutangTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HutangPiutangTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      transaksiId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}transaksi_id'],
      ),
      namaPelanggan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_pelanggan'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}jumlah'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      tanggalJatuhTempo: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}tanggal_jatuh_tempo'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $HutangPiutangTableTable createAlias(String alias) {
    return $HutangPiutangTableTable(attachedDatabase, alias);
  }
}

class HutangPiutangTableData extends DataClass
    implements Insertable<HutangPiutangTableData> {
  final int id;
  final int? transaksiId;
  final String namaPelanggan;
  final double jumlah;
  final String status;
  final DateTime? tanggalJatuhTempo;
  final DateTime createdAt;
  const HutangPiutangTableData({
    required this.id,
    this.transaksiId,
    required this.namaPelanggan,
    required this.jumlah,
    required this.status,
    this.tanggalJatuhTempo,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || transaksiId != null) {
      map['transaksi_id'] = Variable<int>(transaksiId);
    }
    map['nama_pelanggan'] = Variable<String>(namaPelanggan);
    map['jumlah'] = Variable<double>(jumlah);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || tanggalJatuhTempo != null) {
      map['tanggal_jatuh_tempo'] = Variable<DateTime>(tanggalJatuhTempo);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  HutangPiutangTableCompanion toCompanion(bool nullToAbsent) {
    return HutangPiutangTableCompanion(
      id: Value(id),
      transaksiId: transaksiId == null && nullToAbsent
          ? const Value.absent()
          : Value(transaksiId),
      namaPelanggan: Value(namaPelanggan),
      jumlah: Value(jumlah),
      status: Value(status),
      tanggalJatuhTempo: tanggalJatuhTempo == null && nullToAbsent
          ? const Value.absent()
          : Value(tanggalJatuhTempo),
      createdAt: Value(createdAt),
    );
  }

  factory HutangPiutangTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HutangPiutangTableData(
      id: serializer.fromJson<int>(json['id']),
      transaksiId: serializer.fromJson<int?>(json['transaksiId']),
      namaPelanggan: serializer.fromJson<String>(json['namaPelanggan']),
      jumlah: serializer.fromJson<double>(json['jumlah']),
      status: serializer.fromJson<String>(json['status']),
      tanggalJatuhTempo: serializer.fromJson<DateTime?>(
        json['tanggalJatuhTempo'],
      ),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'transaksiId': serializer.toJson<int?>(transaksiId),
      'namaPelanggan': serializer.toJson<String>(namaPelanggan),
      'jumlah': serializer.toJson<double>(jumlah),
      'status': serializer.toJson<String>(status),
      'tanggalJatuhTempo': serializer.toJson<DateTime?>(tanggalJatuhTempo),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  HutangPiutangTableData copyWith({
    int? id,
    Value<int?> transaksiId = const Value.absent(),
    String? namaPelanggan,
    double? jumlah,
    String? status,
    Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
    DateTime? createdAt,
  }) => HutangPiutangTableData(
    id: id ?? this.id,
    transaksiId: transaksiId.present ? transaksiId.value : this.transaksiId,
    namaPelanggan: namaPelanggan ?? this.namaPelanggan,
    jumlah: jumlah ?? this.jumlah,
    status: status ?? this.status,
    tanggalJatuhTempo: tanggalJatuhTempo.present
        ? tanggalJatuhTempo.value
        : this.tanggalJatuhTempo,
    createdAt: createdAt ?? this.createdAt,
  );
  HutangPiutangTableData copyWithCompanion(HutangPiutangTableCompanion data) {
    return HutangPiutangTableData(
      id: data.id.present ? data.id.value : this.id,
      transaksiId: data.transaksiId.present
          ? data.transaksiId.value
          : this.transaksiId,
      namaPelanggan: data.namaPelanggan.present
          ? data.namaPelanggan.value
          : this.namaPelanggan,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      status: data.status.present ? data.status.value : this.status,
      tanggalJatuhTempo: data.tanggalJatuhTempo.present
          ? data.tanggalJatuhTempo.value
          : this.tanggalJatuhTempo,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HutangPiutangTableData(')
          ..write('id: $id, ')
          ..write('transaksiId: $transaksiId, ')
          ..write('namaPelanggan: $namaPelanggan, ')
          ..write('jumlah: $jumlah, ')
          ..write('status: $status, ')
          ..write('tanggalJatuhTempo: $tanggalJatuhTempo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    transaksiId,
    namaPelanggan,
    jumlah,
    status,
    tanggalJatuhTempo,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HutangPiutangTableData &&
          other.id == this.id &&
          other.transaksiId == this.transaksiId &&
          other.namaPelanggan == this.namaPelanggan &&
          other.jumlah == this.jumlah &&
          other.status == this.status &&
          other.tanggalJatuhTempo == this.tanggalJatuhTempo &&
          other.createdAt == this.createdAt);
}

class HutangPiutangTableCompanion
    extends UpdateCompanion<HutangPiutangTableData> {
  final Value<int> id;
  final Value<int?> transaksiId;
  final Value<String> namaPelanggan;
  final Value<double> jumlah;
  final Value<String> status;
  final Value<DateTime?> tanggalJatuhTempo;
  final Value<DateTime> createdAt;
  const HutangPiutangTableCompanion({
    this.id = const Value.absent(),
    this.transaksiId = const Value.absent(),
    this.namaPelanggan = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.status = const Value.absent(),
    this.tanggalJatuhTempo = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HutangPiutangTableCompanion.insert({
    this.id = const Value.absent(),
    this.transaksiId = const Value.absent(),
    required String namaPelanggan,
    required double jumlah,
    this.status = const Value.absent(),
    this.tanggalJatuhTempo = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : namaPelanggan = Value(namaPelanggan),
       jumlah = Value(jumlah);
  static Insertable<HutangPiutangTableData> custom({
    Expression<int>? id,
    Expression<int>? transaksiId,
    Expression<String>? namaPelanggan,
    Expression<double>? jumlah,
    Expression<String>? status,
    Expression<DateTime>? tanggalJatuhTempo,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (transaksiId != null) 'transaksi_id': transaksiId,
      if (namaPelanggan != null) 'nama_pelanggan': namaPelanggan,
      if (jumlah != null) 'jumlah': jumlah,
      if (status != null) 'status': status,
      if (tanggalJatuhTempo != null) 'tanggal_jatuh_tempo': tanggalJatuhTempo,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HutangPiutangTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? transaksiId,
    Value<String>? namaPelanggan,
    Value<double>? jumlah,
    Value<String>? status,
    Value<DateTime?>? tanggalJatuhTempo,
    Value<DateTime>? createdAt,
  }) {
    return HutangPiutangTableCompanion(
      id: id ?? this.id,
      transaksiId: transaksiId ?? this.transaksiId,
      namaPelanggan: namaPelanggan ?? this.namaPelanggan,
      jumlah: jumlah ?? this.jumlah,
      status: status ?? this.status,
      tanggalJatuhTempo: tanggalJatuhTempo ?? this.tanggalJatuhTempo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (transaksiId.present) {
      map['transaksi_id'] = Variable<int>(transaksiId.value);
    }
    if (namaPelanggan.present) {
      map['nama_pelanggan'] = Variable<String>(namaPelanggan.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<double>(jumlah.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (tanggalJatuhTempo.present) {
      map['tanggal_jatuh_tempo'] = Variable<DateTime>(tanggalJatuhTempo.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HutangPiutangTableCompanion(')
          ..write('id: $id, ')
          ..write('transaksiId: $transaksiId, ')
          ..write('namaPelanggan: $namaPelanggan, ')
          ..write('jumlah: $jumlah, ')
          ..write('status: $status, ')
          ..write('tanggalJatuhTempo: $tanggalJatuhTempo, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $RiwayatStokTableTable extends RiwayatStokTable
    with TableInfo<$RiwayatStokTableTable, RiwayatStokTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RiwayatStokTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipeMeta = const VerificationMeta('tipe');
  @override
  late final GeneratedColumn<String> tipe = GeneratedColumn<String>(
    'tipe',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keteranganMeta = const VerificationMeta(
    'keterangan',
  );
  @override
  late final GeneratedColumn<String> keterangan = GeneratedColumn<String>(
    'keterangan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    produkId,
    tipe,
    jumlah,
    keterangan,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'riwayat_stok_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RiwayatStokTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('tipe')) {
      context.handle(
        _tipeMeta,
        tipe.isAcceptableOrUnknown(data['tipe']!, _tipeMeta),
      );
    } else if (isInserting) {
      context.missing(_tipeMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('keterangan')) {
      context.handle(
        _keteranganMeta,
        keterangan.isAcceptableOrUnknown(data['keterangan']!, _keteranganMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RiwayatStokTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RiwayatStokTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      tipe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipe'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      keterangan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keterangan'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RiwayatStokTableTable createAlias(String alias) {
    return $RiwayatStokTableTable(attachedDatabase, alias);
  }
}

class RiwayatStokTableData extends DataClass
    implements Insertable<RiwayatStokTableData> {
  final int id;
  final int produkId;
  final String tipe;
  final int jumlah;
  final String? keterangan;
  final DateTime createdAt;
  const RiwayatStokTableData({
    required this.id,
    required this.produkId,
    required this.tipe,
    required this.jumlah,
    this.keterangan,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['produk_id'] = Variable<int>(produkId);
    map['tipe'] = Variable<String>(tipe);
    map['jumlah'] = Variable<int>(jumlah);
    if (!nullToAbsent || keterangan != null) {
      map['keterangan'] = Variable<String>(keterangan);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RiwayatStokTableCompanion toCompanion(bool nullToAbsent) {
    return RiwayatStokTableCompanion(
      id: Value(id),
      produkId: Value(produkId),
      tipe: Value(tipe),
      jumlah: Value(jumlah),
      keterangan: keterangan == null && nullToAbsent
          ? const Value.absent()
          : Value(keterangan),
      createdAt: Value(createdAt),
    );
  }

  factory RiwayatStokTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RiwayatStokTableData(
      id: serializer.fromJson<int>(json['id']),
      produkId: serializer.fromJson<int>(json['produkId']),
      tipe: serializer.fromJson<String>(json['tipe']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      keterangan: serializer.fromJson<String?>(json['keterangan']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'produkId': serializer.toJson<int>(produkId),
      'tipe': serializer.toJson<String>(tipe),
      'jumlah': serializer.toJson<int>(jumlah),
      'keterangan': serializer.toJson<String?>(keterangan),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RiwayatStokTableData copyWith({
    int? id,
    int? produkId,
    String? tipe,
    int? jumlah,
    Value<String?> keterangan = const Value.absent(),
    DateTime? createdAt,
  }) => RiwayatStokTableData(
    id: id ?? this.id,
    produkId: produkId ?? this.produkId,
    tipe: tipe ?? this.tipe,
    jumlah: jumlah ?? this.jumlah,
    keterangan: keterangan.present ? keterangan.value : this.keterangan,
    createdAt: createdAt ?? this.createdAt,
  );
  RiwayatStokTableData copyWithCompanion(RiwayatStokTableCompanion data) {
    return RiwayatStokTableData(
      id: data.id.present ? data.id.value : this.id,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      tipe: data.tipe.present ? data.tipe.value : this.tipe,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      keterangan: data.keterangan.present
          ? data.keterangan.value
          : this.keterangan,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RiwayatStokTableData(')
          ..write('id: $id, ')
          ..write('produkId: $produkId, ')
          ..write('tipe: $tipe, ')
          ..write('jumlah: $jumlah, ')
          ..write('keterangan: $keterangan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, produkId, tipe, jumlah, keterangan, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RiwayatStokTableData &&
          other.id == this.id &&
          other.produkId == this.produkId &&
          other.tipe == this.tipe &&
          other.jumlah == this.jumlah &&
          other.keterangan == this.keterangan &&
          other.createdAt == this.createdAt);
}

class RiwayatStokTableCompanion extends UpdateCompanion<RiwayatStokTableData> {
  final Value<int> id;
  final Value<int> produkId;
  final Value<String> tipe;
  final Value<int> jumlah;
  final Value<String?> keterangan;
  final Value<DateTime> createdAt;
  const RiwayatStokTableCompanion({
    this.id = const Value.absent(),
    this.produkId = const Value.absent(),
    this.tipe = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.keterangan = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RiwayatStokTableCompanion.insert({
    this.id = const Value.absent(),
    required int produkId,
    required String tipe,
    required int jumlah,
    this.keterangan = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : produkId = Value(produkId),
       tipe = Value(tipe),
       jumlah = Value(jumlah);
  static Insertable<RiwayatStokTableData> custom({
    Expression<int>? id,
    Expression<int>? produkId,
    Expression<String>? tipe,
    Expression<int>? jumlah,
    Expression<String>? keterangan,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (produkId != null) 'produk_id': produkId,
      if (tipe != null) 'tipe': tipe,
      if (jumlah != null) 'jumlah': jumlah,
      if (keterangan != null) 'keterangan': keterangan,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RiwayatStokTableCompanion copyWith({
    Value<int>? id,
    Value<int>? produkId,
    Value<String>? tipe,
    Value<int>? jumlah,
    Value<String?>? keterangan,
    Value<DateTime>? createdAt,
  }) {
    return RiwayatStokTableCompanion(
      id: id ?? this.id,
      produkId: produkId ?? this.produkId,
      tipe: tipe ?? this.tipe,
      jumlah: jumlah ?? this.jumlah,
      keterangan: keterangan ?? this.keterangan,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (tipe.present) {
      map['tipe'] = Variable<String>(tipe.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (keterangan.present) {
      map['keterangan'] = Variable<String>(keterangan.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RiwayatStokTableCompanion(')
          ..write('id: $id, ')
          ..write('produkId: $produkId, ')
          ..write('tipe: $tipe, ')
          ..write('jumlah: $jumlah, ')
          ..write('keterangan: $keterangan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PembelianTableTable extends PembelianTable
    with TableInfo<$PembelianTableTable, PembelianTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PembelianTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaSupplierMeta = const VerificationMeta(
    'namaSupplier',
  );
  @override
  late final GeneratedColumn<String> namaSupplier = GeneratedColumn<String>(
    'nama_supplier',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalHargaMeta = const VerificationMeta(
    'totalHarga',
  );
  @override
  late final GeneratedColumn<double> totalHarga = GeneratedColumn<double>(
    'total_harga',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    namaSupplier,
    totalHarga,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pembelian_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PembelianTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_supplier')) {
      context.handle(
        _namaSupplierMeta,
        namaSupplier.isAcceptableOrUnknown(
          data['nama_supplier']!,
          _namaSupplierMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaSupplierMeta);
    }
    if (data.containsKey('total_harga')) {
      context.handle(
        _totalHargaMeta,
        totalHarga.isAcceptableOrUnknown(data['total_harga']!, _totalHargaMeta),
      );
    } else if (isInserting) {
      context.missing(_totalHargaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PembelianTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PembelianTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      namaSupplier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_supplier'],
      )!,
      totalHarga: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_harga'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PembelianTableTable createAlias(String alias) {
    return $PembelianTableTable(attachedDatabase, alias);
  }
}

class PembelianTableData extends DataClass
    implements Insertable<PembelianTableData> {
  final int id;
  final String namaSupplier;
  final double totalHarga;
  final DateTime createdAt;
  const PembelianTableData({
    required this.id,
    required this.namaSupplier,
    required this.totalHarga,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_supplier'] = Variable<String>(namaSupplier);
    map['total_harga'] = Variable<double>(totalHarga);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PembelianTableCompanion toCompanion(bool nullToAbsent) {
    return PembelianTableCompanion(
      id: Value(id),
      namaSupplier: Value(namaSupplier),
      totalHarga: Value(totalHarga),
      createdAt: Value(createdAt),
    );
  }

  factory PembelianTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PembelianTableData(
      id: serializer.fromJson<int>(json['id']),
      namaSupplier: serializer.fromJson<String>(json['namaSupplier']),
      totalHarga: serializer.fromJson<double>(json['totalHarga']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaSupplier': serializer.toJson<String>(namaSupplier),
      'totalHarga': serializer.toJson<double>(totalHarga),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PembelianTableData copyWith({
    int? id,
    String? namaSupplier,
    double? totalHarga,
    DateTime? createdAt,
  }) => PembelianTableData(
    id: id ?? this.id,
    namaSupplier: namaSupplier ?? this.namaSupplier,
    totalHarga: totalHarga ?? this.totalHarga,
    createdAt: createdAt ?? this.createdAt,
  );
  PembelianTableData copyWithCompanion(PembelianTableCompanion data) {
    return PembelianTableData(
      id: data.id.present ? data.id.value : this.id,
      namaSupplier: data.namaSupplier.present
          ? data.namaSupplier.value
          : this.namaSupplier,
      totalHarga: data.totalHarga.present
          ? data.totalHarga.value
          : this.totalHarga,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PembelianTableData(')
          ..write('id: $id, ')
          ..write('namaSupplier: $namaSupplier, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaSupplier, totalHarga, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PembelianTableData &&
          other.id == this.id &&
          other.namaSupplier == this.namaSupplier &&
          other.totalHarga == this.totalHarga &&
          other.createdAt == this.createdAt);
}

class PembelianTableCompanion extends UpdateCompanion<PembelianTableData> {
  final Value<int> id;
  final Value<String> namaSupplier;
  final Value<double> totalHarga;
  final Value<DateTime> createdAt;
  const PembelianTableCompanion({
    this.id = const Value.absent(),
    this.namaSupplier = const Value.absent(),
    this.totalHarga = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PembelianTableCompanion.insert({
    this.id = const Value.absent(),
    required String namaSupplier,
    required double totalHarga,
    this.createdAt = const Value.absent(),
  }) : namaSupplier = Value(namaSupplier),
       totalHarga = Value(totalHarga);
  static Insertable<PembelianTableData> custom({
    Expression<int>? id,
    Expression<String>? namaSupplier,
    Expression<double>? totalHarga,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaSupplier != null) 'nama_supplier': namaSupplier,
      if (totalHarga != null) 'total_harga': totalHarga,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PembelianTableCompanion copyWith({
    Value<int>? id,
    Value<String>? namaSupplier,
    Value<double>? totalHarga,
    Value<DateTime>? createdAt,
  }) {
    return PembelianTableCompanion(
      id: id ?? this.id,
      namaSupplier: namaSupplier ?? this.namaSupplier,
      totalHarga: totalHarga ?? this.totalHarga,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaSupplier.present) {
      map['nama_supplier'] = Variable<String>(namaSupplier.value);
    }
    if (totalHarga.present) {
      map['total_harga'] = Variable<double>(totalHarga.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PembelianTableCompanion(')
          ..write('id: $id, ')
          ..write('namaSupplier: $namaSupplier, ')
          ..write('totalHarga: $totalHarga, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ItemPembelianTableTable extends ItemPembelianTable
    with TableInfo<$ItemPembelianTableTable, ItemPembelianTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemPembelianTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pembelianIdMeta = const VerificationMeta(
    'pembelianId',
  );
  @override
  late final GeneratedColumn<int> pembelianId = GeneratedColumn<int>(
    'pembelian_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaBeliSatuanMeta = const VerificationMeta(
    'hargaBeliSatuan',
  );
  @override
  late final GeneratedColumn<double> hargaBeliSatuan = GeneratedColumn<double>(
    'harga_beli_satuan',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pembelianId,
    produkId,
    jumlah,
    hargaBeliSatuan,
    subtotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'item_pembelian_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ItemPembelianTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pembelian_id')) {
      context.handle(
        _pembelianIdMeta,
        pembelianId.isAcceptableOrUnknown(
          data['pembelian_id']!,
          _pembelianIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pembelianIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('harga_beli_satuan')) {
      context.handle(
        _hargaBeliSatuanMeta,
        hargaBeliSatuan.isAcceptableOrUnknown(
          data['harga_beli_satuan']!,
          _hargaBeliSatuanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaBeliSatuanMeta);
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemPembelianTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemPembelianTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pembelianId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pembelian_id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      hargaBeliSatuan: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_beli_satuan'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
    );
  }

  @override
  $ItemPembelianTableTable createAlias(String alias) {
    return $ItemPembelianTableTable(attachedDatabase, alias);
  }
}

class ItemPembelianTableData extends DataClass
    implements Insertable<ItemPembelianTableData> {
  final int id;
  final int pembelianId;
  final int produkId;
  final int jumlah;
  final double hargaBeliSatuan;
  final double subtotal;
  const ItemPembelianTableData({
    required this.id,
    required this.pembelianId,
    required this.produkId,
    required this.jumlah,
    required this.hargaBeliSatuan,
    required this.subtotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pembelian_id'] = Variable<int>(pembelianId);
    map['produk_id'] = Variable<int>(produkId);
    map['jumlah'] = Variable<int>(jumlah);
    map['harga_beli_satuan'] = Variable<double>(hargaBeliSatuan);
    map['subtotal'] = Variable<double>(subtotal);
    return map;
  }

  ItemPembelianTableCompanion toCompanion(bool nullToAbsent) {
    return ItemPembelianTableCompanion(
      id: Value(id),
      pembelianId: Value(pembelianId),
      produkId: Value(produkId),
      jumlah: Value(jumlah),
      hargaBeliSatuan: Value(hargaBeliSatuan),
      subtotal: Value(subtotal),
    );
  }

  factory ItemPembelianTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemPembelianTableData(
      id: serializer.fromJson<int>(json['id']),
      pembelianId: serializer.fromJson<int>(json['pembelianId']),
      produkId: serializer.fromJson<int>(json['produkId']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      hargaBeliSatuan: serializer.fromJson<double>(json['hargaBeliSatuan']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pembelianId': serializer.toJson<int>(pembelianId),
      'produkId': serializer.toJson<int>(produkId),
      'jumlah': serializer.toJson<int>(jumlah),
      'hargaBeliSatuan': serializer.toJson<double>(hargaBeliSatuan),
      'subtotal': serializer.toJson<double>(subtotal),
    };
  }

  ItemPembelianTableData copyWith({
    int? id,
    int? pembelianId,
    int? produkId,
    int? jumlah,
    double? hargaBeliSatuan,
    double? subtotal,
  }) => ItemPembelianTableData(
    id: id ?? this.id,
    pembelianId: pembelianId ?? this.pembelianId,
    produkId: produkId ?? this.produkId,
    jumlah: jumlah ?? this.jumlah,
    hargaBeliSatuan: hargaBeliSatuan ?? this.hargaBeliSatuan,
    subtotal: subtotal ?? this.subtotal,
  );
  ItemPembelianTableData copyWithCompanion(ItemPembelianTableCompanion data) {
    return ItemPembelianTableData(
      id: data.id.present ? data.id.value : this.id,
      pembelianId: data.pembelianId.present
          ? data.pembelianId.value
          : this.pembelianId,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      hargaBeliSatuan: data.hargaBeliSatuan.present
          ? data.hargaBeliSatuan.value
          : this.hargaBeliSatuan,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemPembelianTableData(')
          ..write('id: $id, ')
          ..write('pembelianId: $pembelianId, ')
          ..write('produkId: $produkId, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaBeliSatuan: $hargaBeliSatuan, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pembelianId, produkId, jumlah, hargaBeliSatuan, subtotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemPembelianTableData &&
          other.id == this.id &&
          other.pembelianId == this.pembelianId &&
          other.produkId == this.produkId &&
          other.jumlah == this.jumlah &&
          other.hargaBeliSatuan == this.hargaBeliSatuan &&
          other.subtotal == this.subtotal);
}

class ItemPembelianTableCompanion
    extends UpdateCompanion<ItemPembelianTableData> {
  final Value<int> id;
  final Value<int> pembelianId;
  final Value<int> produkId;
  final Value<int> jumlah;
  final Value<double> hargaBeliSatuan;
  final Value<double> subtotal;
  const ItemPembelianTableCompanion({
    this.id = const Value.absent(),
    this.pembelianId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.hargaBeliSatuan = const Value.absent(),
    this.subtotal = const Value.absent(),
  });
  ItemPembelianTableCompanion.insert({
    this.id = const Value.absent(),
    required int pembelianId,
    required int produkId,
    required int jumlah,
    required double hargaBeliSatuan,
    required double subtotal,
  }) : pembelianId = Value(pembelianId),
       produkId = Value(produkId),
       jumlah = Value(jumlah),
       hargaBeliSatuan = Value(hargaBeliSatuan),
       subtotal = Value(subtotal);
  static Insertable<ItemPembelianTableData> custom({
    Expression<int>? id,
    Expression<int>? pembelianId,
    Expression<int>? produkId,
    Expression<int>? jumlah,
    Expression<double>? hargaBeliSatuan,
    Expression<double>? subtotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pembelianId != null) 'pembelian_id': pembelianId,
      if (produkId != null) 'produk_id': produkId,
      if (jumlah != null) 'jumlah': jumlah,
      if (hargaBeliSatuan != null) 'harga_beli_satuan': hargaBeliSatuan,
      if (subtotal != null) 'subtotal': subtotal,
    });
  }

  ItemPembelianTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pembelianId,
    Value<int>? produkId,
    Value<int>? jumlah,
    Value<double>? hargaBeliSatuan,
    Value<double>? subtotal,
  }) {
    return ItemPembelianTableCompanion(
      id: id ?? this.id,
      pembelianId: pembelianId ?? this.pembelianId,
      produkId: produkId ?? this.produkId,
      jumlah: jumlah ?? this.jumlah,
      hargaBeliSatuan: hargaBeliSatuan ?? this.hargaBeliSatuan,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pembelianId.present) {
      map['pembelian_id'] = Variable<int>(pembelianId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (hargaBeliSatuan.present) {
      map['harga_beli_satuan'] = Variable<double>(hargaBeliSatuan.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemPembelianTableCompanion(')
          ..write('id: $id, ')
          ..write('pembelianId: $pembelianId, ')
          ..write('produkId: $produkId, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaBeliSatuan: $hargaBeliSatuan, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }
}

class $PendingOrderTableTable extends PendingOrderTable
    with TableInfo<$PendingOrderTableTable, PendingOrderTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingOrderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaPelangganMeta = const VerificationMeta(
    'namaPelanggan',
  );
  @override
  late final GeneratedColumn<String> namaPelanggan = GeneratedColumn<String>(
    'nama_pelanggan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _catatanMeta = const VerificationMeta(
    'catatan',
  );
  @override
  late final GeneratedColumn<String> catatan = GeneratedColumn<String>(
    'catatan',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, namaPelanggan, catatan, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_order_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingOrderTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama_pelanggan')) {
      context.handle(
        _namaPelangganMeta,
        namaPelanggan.isAcceptableOrUnknown(
          data['nama_pelanggan']!,
          _namaPelangganMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_namaPelangganMeta);
    }
    if (data.containsKey('catatan')) {
      context.handle(
        _catatanMeta,
        catatan.isAcceptableOrUnknown(data['catatan']!, _catatanMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingOrderTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingOrderTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      namaPelanggan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_pelanggan'],
      )!,
      catatan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}catatan'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $PendingOrderTableTable createAlias(String alias) {
    return $PendingOrderTableTable(attachedDatabase, alias);
  }
}

class PendingOrderTableData extends DataClass
    implements Insertable<PendingOrderTableData> {
  final int id;
  final String namaPelanggan;
  final String? catatan;
  final DateTime createdAt;
  const PendingOrderTableData({
    required this.id,
    required this.namaPelanggan,
    this.catatan,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama_pelanggan'] = Variable<String>(namaPelanggan);
    if (!nullToAbsent || catatan != null) {
      map['catatan'] = Variable<String>(catatan);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  PendingOrderTableCompanion toCompanion(bool nullToAbsent) {
    return PendingOrderTableCompanion(
      id: Value(id),
      namaPelanggan: Value(namaPelanggan),
      catatan: catatan == null && nullToAbsent
          ? const Value.absent()
          : Value(catatan),
      createdAt: Value(createdAt),
    );
  }

  factory PendingOrderTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingOrderTableData(
      id: serializer.fromJson<int>(json['id']),
      namaPelanggan: serializer.fromJson<String>(json['namaPelanggan']),
      catatan: serializer.fromJson<String?>(json['catatan']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'namaPelanggan': serializer.toJson<String>(namaPelanggan),
      'catatan': serializer.toJson<String?>(catatan),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  PendingOrderTableData copyWith({
    int? id,
    String? namaPelanggan,
    Value<String?> catatan = const Value.absent(),
    DateTime? createdAt,
  }) => PendingOrderTableData(
    id: id ?? this.id,
    namaPelanggan: namaPelanggan ?? this.namaPelanggan,
    catatan: catatan.present ? catatan.value : this.catatan,
    createdAt: createdAt ?? this.createdAt,
  );
  PendingOrderTableData copyWithCompanion(PendingOrderTableCompanion data) {
    return PendingOrderTableData(
      id: data.id.present ? data.id.value : this.id,
      namaPelanggan: data.namaPelanggan.present
          ? data.namaPelanggan.value
          : this.namaPelanggan,
      catatan: data.catatan.present ? data.catatan.value : this.catatan,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingOrderTableData(')
          ..write('id: $id, ')
          ..write('namaPelanggan: $namaPelanggan, ')
          ..write('catatan: $catatan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, namaPelanggan, catatan, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingOrderTableData &&
          other.id == this.id &&
          other.namaPelanggan == this.namaPelanggan &&
          other.catatan == this.catatan &&
          other.createdAt == this.createdAt);
}

class PendingOrderTableCompanion
    extends UpdateCompanion<PendingOrderTableData> {
  final Value<int> id;
  final Value<String> namaPelanggan;
  final Value<String?> catatan;
  final Value<DateTime> createdAt;
  const PendingOrderTableCompanion({
    this.id = const Value.absent(),
    this.namaPelanggan = const Value.absent(),
    this.catatan = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  PendingOrderTableCompanion.insert({
    this.id = const Value.absent(),
    required String namaPelanggan,
    this.catatan = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : namaPelanggan = Value(namaPelanggan);
  static Insertable<PendingOrderTableData> custom({
    Expression<int>? id,
    Expression<String>? namaPelanggan,
    Expression<String>? catatan,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (namaPelanggan != null) 'nama_pelanggan': namaPelanggan,
      if (catatan != null) 'catatan': catatan,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  PendingOrderTableCompanion copyWith({
    Value<int>? id,
    Value<String>? namaPelanggan,
    Value<String?>? catatan,
    Value<DateTime>? createdAt,
  }) {
    return PendingOrderTableCompanion(
      id: id ?? this.id,
      namaPelanggan: namaPelanggan ?? this.namaPelanggan,
      catatan: catatan ?? this.catatan,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (namaPelanggan.present) {
      map['nama_pelanggan'] = Variable<String>(namaPelanggan.value);
    }
    if (catatan.present) {
      map['catatan'] = Variable<String>(catatan.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingOrderTableCompanion(')
          ..write('id: $id, ')
          ..write('namaPelanggan: $namaPelanggan, ')
          ..write('catatan: $catatan, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PendingOrderItemTableTable extends PendingOrderItemTable
    with TableInfo<$PendingOrderItemTableTable, PendingOrderItemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingOrderItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pendingOrderIdMeta = const VerificationMeta(
    'pendingOrderId',
  );
  @override
  late final GeneratedColumn<int> pendingOrderId = GeneratedColumn<int>(
    'pending_order_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaProdukMeta = const VerificationMeta(
    'namaProduk',
  );
  @override
  late final GeneratedColumn<String> namaProduk = GeneratedColumn<String>(
    'nama_produk',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaJualMeta = const VerificationMeta(
    'hargaJual',
  );
  @override
  late final GeneratedColumn<double> hargaJual = GeneratedColumn<double>(
    'harga_jual',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diskonTipeMeta = const VerificationMeta(
    'diskonTipe',
  );
  @override
  late final GeneratedColumn<int> diskonTipe = GeneratedColumn<int>(
    'diskon_tipe',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _diskonValueMeta = const VerificationMeta(
    'diskonValue',
  );
  @override
  late final GeneratedColumn<double> diskonValue = GeneratedColumn<double>(
    'diskon_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _subtotalMeta = const VerificationMeta(
    'subtotal',
  );
  @override
  late final GeneratedColumn<double> subtotal = GeneratedColumn<double>(
    'subtotal',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pendingOrderId,
    produkId,
    namaProduk,
    hargaJual,
    jumlah,
    diskonTipe,
    diskonValue,
    subtotal,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_order_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingOrderItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pending_order_id')) {
      context.handle(
        _pendingOrderIdMeta,
        pendingOrderId.isAcceptableOrUnknown(
          data['pending_order_id']!,
          _pendingOrderIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pendingOrderIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('nama_produk')) {
      context.handle(
        _namaProdukMeta,
        namaProduk.isAcceptableOrUnknown(data['nama_produk']!, _namaProdukMeta),
      );
    } else if (isInserting) {
      context.missing(_namaProdukMeta);
    }
    if (data.containsKey('harga_jual')) {
      context.handle(
        _hargaJualMeta,
        hargaJual.isAcceptableOrUnknown(data['harga_jual']!, _hargaJualMeta),
      );
    } else if (isInserting) {
      context.missing(_hargaJualMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('diskon_tipe')) {
      context.handle(
        _diskonTipeMeta,
        diskonTipe.isAcceptableOrUnknown(data['diskon_tipe']!, _diskonTipeMeta),
      );
    }
    if (data.containsKey('diskon_value')) {
      context.handle(
        _diskonValueMeta,
        diskonValue.isAcceptableOrUnknown(
          data['diskon_value']!,
          _diskonValueMeta,
        ),
      );
    }
    if (data.containsKey('subtotal')) {
      context.handle(
        _subtotalMeta,
        subtotal.isAcceptableOrUnknown(data['subtotal']!, _subtotalMeta),
      );
    } else if (isInserting) {
      context.missing(_subtotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingOrderItemTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingOrderItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pendingOrderId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_order_id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      namaProduk: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_produk'],
      )!,
      hargaJual: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_jual'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      diskonTipe: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diskon_tipe'],
      )!,
      diskonValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diskon_value'],
      )!,
      subtotal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}subtotal'],
      )!,
    );
  }

  @override
  $PendingOrderItemTableTable createAlias(String alias) {
    return $PendingOrderItemTableTable(attachedDatabase, alias);
  }
}

class PendingOrderItemTableData extends DataClass
    implements Insertable<PendingOrderItemTableData> {
  final int id;
  final int pendingOrderId;
  final int produkId;
  final String namaProduk;
  final double hargaJual;
  final int jumlah;
  final int diskonTipe;
  final double diskonValue;
  final double subtotal;
  const PendingOrderItemTableData({
    required this.id,
    required this.pendingOrderId,
    required this.produkId,
    required this.namaProduk,
    required this.hargaJual,
    required this.jumlah,
    required this.diskonTipe,
    required this.diskonValue,
    required this.subtotal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pending_order_id'] = Variable<int>(pendingOrderId);
    map['produk_id'] = Variable<int>(produkId);
    map['nama_produk'] = Variable<String>(namaProduk);
    map['harga_jual'] = Variable<double>(hargaJual);
    map['jumlah'] = Variable<int>(jumlah);
    map['diskon_tipe'] = Variable<int>(diskonTipe);
    map['diskon_value'] = Variable<double>(diskonValue);
    map['subtotal'] = Variable<double>(subtotal);
    return map;
  }

  PendingOrderItemTableCompanion toCompanion(bool nullToAbsent) {
    return PendingOrderItemTableCompanion(
      id: Value(id),
      pendingOrderId: Value(pendingOrderId),
      produkId: Value(produkId),
      namaProduk: Value(namaProduk),
      hargaJual: Value(hargaJual),
      jumlah: Value(jumlah),
      diskonTipe: Value(diskonTipe),
      diskonValue: Value(diskonValue),
      subtotal: Value(subtotal),
    );
  }

  factory PendingOrderItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingOrderItemTableData(
      id: serializer.fromJson<int>(json['id']),
      pendingOrderId: serializer.fromJson<int>(json['pendingOrderId']),
      produkId: serializer.fromJson<int>(json['produkId']),
      namaProduk: serializer.fromJson<String>(json['namaProduk']),
      hargaJual: serializer.fromJson<double>(json['hargaJual']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      diskonTipe: serializer.fromJson<int>(json['diskonTipe']),
      diskonValue: serializer.fromJson<double>(json['diskonValue']),
      subtotal: serializer.fromJson<double>(json['subtotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pendingOrderId': serializer.toJson<int>(pendingOrderId),
      'produkId': serializer.toJson<int>(produkId),
      'namaProduk': serializer.toJson<String>(namaProduk),
      'hargaJual': serializer.toJson<double>(hargaJual),
      'jumlah': serializer.toJson<int>(jumlah),
      'diskonTipe': serializer.toJson<int>(diskonTipe),
      'diskonValue': serializer.toJson<double>(diskonValue),
      'subtotal': serializer.toJson<double>(subtotal),
    };
  }

  PendingOrderItemTableData copyWith({
    int? id,
    int? pendingOrderId,
    int? produkId,
    String? namaProduk,
    double? hargaJual,
    int? jumlah,
    int? diskonTipe,
    double? diskonValue,
    double? subtotal,
  }) => PendingOrderItemTableData(
    id: id ?? this.id,
    pendingOrderId: pendingOrderId ?? this.pendingOrderId,
    produkId: produkId ?? this.produkId,
    namaProduk: namaProduk ?? this.namaProduk,
    hargaJual: hargaJual ?? this.hargaJual,
    jumlah: jumlah ?? this.jumlah,
    diskonTipe: diskonTipe ?? this.diskonTipe,
    diskonValue: diskonValue ?? this.diskonValue,
    subtotal: subtotal ?? this.subtotal,
  );
  PendingOrderItemTableData copyWithCompanion(
    PendingOrderItemTableCompanion data,
  ) {
    return PendingOrderItemTableData(
      id: data.id.present ? data.id.value : this.id,
      pendingOrderId: data.pendingOrderId.present
          ? data.pendingOrderId.value
          : this.pendingOrderId,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      namaProduk: data.namaProduk.present
          ? data.namaProduk.value
          : this.namaProduk,
      hargaJual: data.hargaJual.present ? data.hargaJual.value : this.hargaJual,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      diskonTipe: data.diskonTipe.present
          ? data.diskonTipe.value
          : this.diskonTipe,
      diskonValue: data.diskonValue.present
          ? data.diskonValue.value
          : this.diskonValue,
      subtotal: data.subtotal.present ? data.subtotal.value : this.subtotal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingOrderItemTableData(')
          ..write('id: $id, ')
          ..write('pendingOrderId: $pendingOrderId, ')
          ..write('produkId: $produkId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('hargaJual: $hargaJual, ')
          ..write('jumlah: $jumlah, ')
          ..write('diskonTipe: $diskonTipe, ')
          ..write('diskonValue: $diskonValue, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pendingOrderId,
    produkId,
    namaProduk,
    hargaJual,
    jumlah,
    diskonTipe,
    diskonValue,
    subtotal,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingOrderItemTableData &&
          other.id == this.id &&
          other.pendingOrderId == this.pendingOrderId &&
          other.produkId == this.produkId &&
          other.namaProduk == this.namaProduk &&
          other.hargaJual == this.hargaJual &&
          other.jumlah == this.jumlah &&
          other.diskonTipe == this.diskonTipe &&
          other.diskonValue == this.diskonValue &&
          other.subtotal == this.subtotal);
}

class PendingOrderItemTableCompanion
    extends UpdateCompanion<PendingOrderItemTableData> {
  final Value<int> id;
  final Value<int> pendingOrderId;
  final Value<int> produkId;
  final Value<String> namaProduk;
  final Value<double> hargaJual;
  final Value<int> jumlah;
  final Value<int> diskonTipe;
  final Value<double> diskonValue;
  final Value<double> subtotal;
  const PendingOrderItemTableCompanion({
    this.id = const Value.absent(),
    this.pendingOrderId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.namaProduk = const Value.absent(),
    this.hargaJual = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.diskonTipe = const Value.absent(),
    this.diskonValue = const Value.absent(),
    this.subtotal = const Value.absent(),
  });
  PendingOrderItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int pendingOrderId,
    required int produkId,
    required String namaProduk,
    required double hargaJual,
    required int jumlah,
    this.diskonTipe = const Value.absent(),
    this.diskonValue = const Value.absent(),
    required double subtotal,
  }) : pendingOrderId = Value(pendingOrderId),
       produkId = Value(produkId),
       namaProduk = Value(namaProduk),
       hargaJual = Value(hargaJual),
       jumlah = Value(jumlah),
       subtotal = Value(subtotal);
  static Insertable<PendingOrderItemTableData> custom({
    Expression<int>? id,
    Expression<int>? pendingOrderId,
    Expression<int>? produkId,
    Expression<String>? namaProduk,
    Expression<double>? hargaJual,
    Expression<int>? jumlah,
    Expression<int>? diskonTipe,
    Expression<double>? diskonValue,
    Expression<double>? subtotal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pendingOrderId != null) 'pending_order_id': pendingOrderId,
      if (produkId != null) 'produk_id': produkId,
      if (namaProduk != null) 'nama_produk': namaProduk,
      if (hargaJual != null) 'harga_jual': hargaJual,
      if (jumlah != null) 'jumlah': jumlah,
      if (diskonTipe != null) 'diskon_tipe': diskonTipe,
      if (diskonValue != null) 'diskon_value': diskonValue,
      if (subtotal != null) 'subtotal': subtotal,
    });
  }

  PendingOrderItemTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pendingOrderId,
    Value<int>? produkId,
    Value<String>? namaProduk,
    Value<double>? hargaJual,
    Value<int>? jumlah,
    Value<int>? diskonTipe,
    Value<double>? diskonValue,
    Value<double>? subtotal,
  }) {
    return PendingOrderItemTableCompanion(
      id: id ?? this.id,
      pendingOrderId: pendingOrderId ?? this.pendingOrderId,
      produkId: produkId ?? this.produkId,
      namaProduk: namaProduk ?? this.namaProduk,
      hargaJual: hargaJual ?? this.hargaJual,
      jumlah: jumlah ?? this.jumlah,
      diskonTipe: diskonTipe ?? this.diskonTipe,
      diskonValue: diskonValue ?? this.diskonValue,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pendingOrderId.present) {
      map['pending_order_id'] = Variable<int>(pendingOrderId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (namaProduk.present) {
      map['nama_produk'] = Variable<String>(namaProduk.value);
    }
    if (hargaJual.present) {
      map['harga_jual'] = Variable<double>(hargaJual.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (diskonTipe.present) {
      map['diskon_tipe'] = Variable<int>(diskonTipe.value);
    }
    if (diskonValue.present) {
      map['diskon_value'] = Variable<double>(diskonValue.value);
    }
    if (subtotal.present) {
      map['subtotal'] = Variable<double>(subtotal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingOrderItemTableCompanion(')
          ..write('id: $id, ')
          ..write('pendingOrderId: $pendingOrderId, ')
          ..write('produkId: $produkId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('hargaJual: $hargaJual, ')
          ..write('jumlah: $jumlah, ')
          ..write('diskonTipe: $diskonTipe, ')
          ..write('diskonValue: $diskonValue, ')
          ..write('subtotal: $subtotal')
          ..write(')'))
        .toString();
  }
}

class $PendingPembelianTableTable extends PendingPembelianTable
    with TableInfo<$PendingPembelianTableTable, PendingPembelianTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingPembelianTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _namaSupplierMeta = const VerificationMeta(
    'namaSupplier',
  );
  @override
  late final GeneratedColumn<String> namaSupplier = GeneratedColumn<String>(
    'nama_supplier',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _isPpnEnabledMeta = const VerificationMeta(
    'isPpnEnabled',
  );
  @override
  late final GeneratedColumn<bool> isPpnEnabled = GeneratedColumn<bool>(
    'is_ppn_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_ppn_enabled" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _ppnPercentMeta = const VerificationMeta(
    'ppnPercent',
  );
  @override
  late final GeneratedColumn<double> ppnPercent = GeneratedColumn<double>(
    'ppn_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(11.0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    namaSupplier,
    createdAt,
    isPpnEnabled,
    ppnPercent,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_pembelian_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingPembelianTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    }
    if (data.containsKey('nama_supplier')) {
      context.handle(
        _namaSupplierMeta,
        namaSupplier.isAcceptableOrUnknown(
          data['nama_supplier']!,
          _namaSupplierMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('is_ppn_enabled')) {
      context.handle(
        _isPpnEnabledMeta,
        isPpnEnabled.isAcceptableOrUnknown(
          data['is_ppn_enabled']!,
          _isPpnEnabledMeta,
        ),
      );
    }
    if (data.containsKey('ppn_percent')) {
      context.handle(
        _ppnPercentMeta,
        ppnPercent.isAcceptableOrUnknown(data['ppn_percent']!, _ppnPercentMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingPembelianTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingPembelianTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      ),
      namaSupplier: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_supplier'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      isPpnEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_ppn_enabled'],
      )!,
      ppnPercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ppn_percent'],
      )!,
    );
  }

  @override
  $PendingPembelianTableTable createAlias(String alias) {
    return $PendingPembelianTableTable(attachedDatabase, alias);
  }
}

class PendingPembelianTableData extends DataClass
    implements Insertable<PendingPembelianTableData> {
  final int id;
  final int? supplierId;
  final String? namaSupplier;
  final DateTime createdAt;
  final bool isPpnEnabled;
  final double ppnPercent;
  const PendingPembelianTableData({
    required this.id,
    this.supplierId,
    this.namaSupplier,
    required this.createdAt,
    required this.isPpnEnabled,
    required this.ppnPercent,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<int>(supplierId);
    }
    if (!nullToAbsent || namaSupplier != null) {
      map['nama_supplier'] = Variable<String>(namaSupplier);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['is_ppn_enabled'] = Variable<bool>(isPpnEnabled);
    map['ppn_percent'] = Variable<double>(ppnPercent);
    return map;
  }

  PendingPembelianTableCompanion toCompanion(bool nullToAbsent) {
    return PendingPembelianTableCompanion(
      id: Value(id),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      namaSupplier: namaSupplier == null && nullToAbsent
          ? const Value.absent()
          : Value(namaSupplier),
      createdAt: Value(createdAt),
      isPpnEnabled: Value(isPpnEnabled),
      ppnPercent: Value(ppnPercent),
    );
  }

  factory PendingPembelianTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingPembelianTableData(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int?>(json['supplierId']),
      namaSupplier: serializer.fromJson<String?>(json['namaSupplier']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      isPpnEnabled: serializer.fromJson<bool>(json['isPpnEnabled']),
      ppnPercent: serializer.fromJson<double>(json['ppnPercent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int?>(supplierId),
      'namaSupplier': serializer.toJson<String?>(namaSupplier),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'isPpnEnabled': serializer.toJson<bool>(isPpnEnabled),
      'ppnPercent': serializer.toJson<double>(ppnPercent),
    };
  }

  PendingPembelianTableData copyWith({
    int? id,
    Value<int?> supplierId = const Value.absent(),
    Value<String?> namaSupplier = const Value.absent(),
    DateTime? createdAt,
    bool? isPpnEnabled,
    double? ppnPercent,
  }) => PendingPembelianTableData(
    id: id ?? this.id,
    supplierId: supplierId.present ? supplierId.value : this.supplierId,
    namaSupplier: namaSupplier.present ? namaSupplier.value : this.namaSupplier,
    createdAt: createdAt ?? this.createdAt,
    isPpnEnabled: isPpnEnabled ?? this.isPpnEnabled,
    ppnPercent: ppnPercent ?? this.ppnPercent,
  );
  PendingPembelianTableData copyWithCompanion(
    PendingPembelianTableCompanion data,
  ) {
    return PendingPembelianTableData(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      namaSupplier: data.namaSupplier.present
          ? data.namaSupplier.value
          : this.namaSupplier,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isPpnEnabled: data.isPpnEnabled.present
          ? data.isPpnEnabled.value
          : this.isPpnEnabled,
      ppnPercent: data.ppnPercent.present
          ? data.ppnPercent.value
          : this.ppnPercent,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingPembelianTableData(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('namaSupplier: $namaSupplier, ')
          ..write('createdAt: $createdAt, ')
          ..write('isPpnEnabled: $isPpnEnabled, ')
          ..write('ppnPercent: $ppnPercent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    supplierId,
    namaSupplier,
    createdAt,
    isPpnEnabled,
    ppnPercent,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingPembelianTableData &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.namaSupplier == this.namaSupplier &&
          other.createdAt == this.createdAt &&
          other.isPpnEnabled == this.isPpnEnabled &&
          other.ppnPercent == this.ppnPercent);
}

class PendingPembelianTableCompanion
    extends UpdateCompanion<PendingPembelianTableData> {
  final Value<int> id;
  final Value<int?> supplierId;
  final Value<String?> namaSupplier;
  final Value<DateTime> createdAt;
  final Value<bool> isPpnEnabled;
  final Value<double> ppnPercent;
  const PendingPembelianTableCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.namaSupplier = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isPpnEnabled = const Value.absent(),
    this.ppnPercent = const Value.absent(),
  });
  PendingPembelianTableCompanion.insert({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.namaSupplier = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isPpnEnabled = const Value.absent(),
    this.ppnPercent = const Value.absent(),
  });
  static Insertable<PendingPembelianTableData> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<String>? namaSupplier,
    Expression<DateTime>? createdAt,
    Expression<bool>? isPpnEnabled,
    Expression<double>? ppnPercent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (namaSupplier != null) 'nama_supplier': namaSupplier,
      if (createdAt != null) 'created_at': createdAt,
      if (isPpnEnabled != null) 'is_ppn_enabled': isPpnEnabled,
      if (ppnPercent != null) 'ppn_percent': ppnPercent,
    });
  }

  PendingPembelianTableCompanion copyWith({
    Value<int>? id,
    Value<int?>? supplierId,
    Value<String?>? namaSupplier,
    Value<DateTime>? createdAt,
    Value<bool>? isPpnEnabled,
    Value<double>? ppnPercent,
  }) {
    return PendingPembelianTableCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      namaSupplier: namaSupplier ?? this.namaSupplier,
      createdAt: createdAt ?? this.createdAt,
      isPpnEnabled: isPpnEnabled ?? this.isPpnEnabled,
      ppnPercent: ppnPercent ?? this.ppnPercent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (namaSupplier.present) {
      map['nama_supplier'] = Variable<String>(namaSupplier.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (isPpnEnabled.present) {
      map['is_ppn_enabled'] = Variable<bool>(isPpnEnabled.value);
    }
    if (ppnPercent.present) {
      map['ppn_percent'] = Variable<double>(ppnPercent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingPembelianTableCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('namaSupplier: $namaSupplier, ')
          ..write('createdAt: $createdAt, ')
          ..write('isPpnEnabled: $isPpnEnabled, ')
          ..write('ppnPercent: $ppnPercent')
          ..write(')'))
        .toString();
  }
}

class $PendingPembelianItemTableTable extends PendingPembelianItemTable
    with
        TableInfo<
          $PendingPembelianItemTableTable,
          PendingPembelianItemTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingPembelianItemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _pendingPembelianIdMeta =
      const VerificationMeta('pendingPembelianId');
  @override
  late final GeneratedColumn<int> pendingPembelianId = GeneratedColumn<int>(
    'pending_pembelian_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaProdukMeta = const VerificationMeta(
    'namaProduk',
  );
  @override
  late final GeneratedColumn<String> namaProduk = GeneratedColumn<String>(
    'nama_produk',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _jumlahMeta = const VerificationMeta('jumlah');
  @override
  late final GeneratedColumn<int> jumlah = GeneratedColumn<int>(
    'jumlah',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaBeliSatuanMeta = const VerificationMeta(
    'hargaBeliSatuan',
  );
  @override
  late final GeneratedColumn<double> hargaBeliSatuan = GeneratedColumn<double>(
    'harga_beli_satuan',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hargaBeliLamaMeta = const VerificationMeta(
    'hargaBeliLama',
  );
  @override
  late final GeneratedColumn<double> hargaBeliLama = GeneratedColumn<double>(
    'harga_beli_lama',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _diskonTipeMeta = const VerificationMeta(
    'diskonTipe',
  );
  @override
  late final GeneratedColumn<int> diskonTipe = GeneratedColumn<int>(
    'diskon_tipe',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _diskonValueMeta = const VerificationMeta(
    'diskonValue',
  );
  @override
  late final GeneratedColumn<double> diskonValue = GeneratedColumn<double>(
    'diskon_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pendingPembelianId,
    produkId,
    namaProduk,
    jumlah,
    hargaBeliSatuan,
    hargaBeliLama,
    diskonTipe,
    diskonValue,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_pembelian_item_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingPembelianItemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pending_pembelian_id')) {
      context.handle(
        _pendingPembelianIdMeta,
        pendingPembelianId.isAcceptableOrUnknown(
          data['pending_pembelian_id']!,
          _pendingPembelianIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pendingPembelianIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('nama_produk')) {
      context.handle(
        _namaProdukMeta,
        namaProduk.isAcceptableOrUnknown(data['nama_produk']!, _namaProdukMeta),
      );
    } else if (isInserting) {
      context.missing(_namaProdukMeta);
    }
    if (data.containsKey('jumlah')) {
      context.handle(
        _jumlahMeta,
        jumlah.isAcceptableOrUnknown(data['jumlah']!, _jumlahMeta),
      );
    } else if (isInserting) {
      context.missing(_jumlahMeta);
    }
    if (data.containsKey('harga_beli_satuan')) {
      context.handle(
        _hargaBeliSatuanMeta,
        hargaBeliSatuan.isAcceptableOrUnknown(
          data['harga_beli_satuan']!,
          _hargaBeliSatuanMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaBeliSatuanMeta);
    }
    if (data.containsKey('harga_beli_lama')) {
      context.handle(
        _hargaBeliLamaMeta,
        hargaBeliLama.isAcceptableOrUnknown(
          data['harga_beli_lama']!,
          _hargaBeliLamaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hargaBeliLamaMeta);
    }
    if (data.containsKey('diskon_tipe')) {
      context.handle(
        _diskonTipeMeta,
        diskonTipe.isAcceptableOrUnknown(data['diskon_tipe']!, _diskonTipeMeta),
      );
    }
    if (data.containsKey('diskon_value')) {
      context.handle(
        _diskonValueMeta,
        diskonValue.isAcceptableOrUnknown(
          data['diskon_value']!,
          _diskonValueMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PendingPembelianItemTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingPembelianItemTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      pendingPembelianId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pending_pembelian_id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      namaProduk: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama_produk'],
      )!,
      jumlah: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}jumlah'],
      )!,
      hargaBeliSatuan: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_beli_satuan'],
      )!,
      hargaBeliLama: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}harga_beli_lama'],
      )!,
      diskonTipe: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diskon_tipe'],
      )!,
      diskonValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}diskon_value'],
      )!,
    );
  }

  @override
  $PendingPembelianItemTableTable createAlias(String alias) {
    return $PendingPembelianItemTableTable(attachedDatabase, alias);
  }
}

class PendingPembelianItemTableData extends DataClass
    implements Insertable<PendingPembelianItemTableData> {
  final int id;
  final int pendingPembelianId;
  final int produkId;
  final String namaProduk;
  final int jumlah;
  final double hargaBeliSatuan;
  final double hargaBeliLama;
  final int diskonTipe;
  final double diskonValue;
  const PendingPembelianItemTableData({
    required this.id,
    required this.pendingPembelianId,
    required this.produkId,
    required this.namaProduk,
    required this.jumlah,
    required this.hargaBeliSatuan,
    required this.hargaBeliLama,
    required this.diskonTipe,
    required this.diskonValue,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pending_pembelian_id'] = Variable<int>(pendingPembelianId);
    map['produk_id'] = Variable<int>(produkId);
    map['nama_produk'] = Variable<String>(namaProduk);
    map['jumlah'] = Variable<int>(jumlah);
    map['harga_beli_satuan'] = Variable<double>(hargaBeliSatuan);
    map['harga_beli_lama'] = Variable<double>(hargaBeliLama);
    map['diskon_tipe'] = Variable<int>(diskonTipe);
    map['diskon_value'] = Variable<double>(diskonValue);
    return map;
  }

  PendingPembelianItemTableCompanion toCompanion(bool nullToAbsent) {
    return PendingPembelianItemTableCompanion(
      id: Value(id),
      pendingPembelianId: Value(pendingPembelianId),
      produkId: Value(produkId),
      namaProduk: Value(namaProduk),
      jumlah: Value(jumlah),
      hargaBeliSatuan: Value(hargaBeliSatuan),
      hargaBeliLama: Value(hargaBeliLama),
      diskonTipe: Value(diskonTipe),
      diskonValue: Value(diskonValue),
    );
  }

  factory PendingPembelianItemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingPembelianItemTableData(
      id: serializer.fromJson<int>(json['id']),
      pendingPembelianId: serializer.fromJson<int>(json['pendingPembelianId']),
      produkId: serializer.fromJson<int>(json['produkId']),
      namaProduk: serializer.fromJson<String>(json['namaProduk']),
      jumlah: serializer.fromJson<int>(json['jumlah']),
      hargaBeliSatuan: serializer.fromJson<double>(json['hargaBeliSatuan']),
      hargaBeliLama: serializer.fromJson<double>(json['hargaBeliLama']),
      diskonTipe: serializer.fromJson<int>(json['diskonTipe']),
      diskonValue: serializer.fromJson<double>(json['diskonValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'pendingPembelianId': serializer.toJson<int>(pendingPembelianId),
      'produkId': serializer.toJson<int>(produkId),
      'namaProduk': serializer.toJson<String>(namaProduk),
      'jumlah': serializer.toJson<int>(jumlah),
      'hargaBeliSatuan': serializer.toJson<double>(hargaBeliSatuan),
      'hargaBeliLama': serializer.toJson<double>(hargaBeliLama),
      'diskonTipe': serializer.toJson<int>(diskonTipe),
      'diskonValue': serializer.toJson<double>(diskonValue),
    };
  }

  PendingPembelianItemTableData copyWith({
    int? id,
    int? pendingPembelianId,
    int? produkId,
    String? namaProduk,
    int? jumlah,
    double? hargaBeliSatuan,
    double? hargaBeliLama,
    int? diskonTipe,
    double? diskonValue,
  }) => PendingPembelianItemTableData(
    id: id ?? this.id,
    pendingPembelianId: pendingPembelianId ?? this.pendingPembelianId,
    produkId: produkId ?? this.produkId,
    namaProduk: namaProduk ?? this.namaProduk,
    jumlah: jumlah ?? this.jumlah,
    hargaBeliSatuan: hargaBeliSatuan ?? this.hargaBeliSatuan,
    hargaBeliLama: hargaBeliLama ?? this.hargaBeliLama,
    diskonTipe: diskonTipe ?? this.diskonTipe,
    diskonValue: diskonValue ?? this.diskonValue,
  );
  PendingPembelianItemTableData copyWithCompanion(
    PendingPembelianItemTableCompanion data,
  ) {
    return PendingPembelianItemTableData(
      id: data.id.present ? data.id.value : this.id,
      pendingPembelianId: data.pendingPembelianId.present
          ? data.pendingPembelianId.value
          : this.pendingPembelianId,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      namaProduk: data.namaProduk.present
          ? data.namaProduk.value
          : this.namaProduk,
      jumlah: data.jumlah.present ? data.jumlah.value : this.jumlah,
      hargaBeliSatuan: data.hargaBeliSatuan.present
          ? data.hargaBeliSatuan.value
          : this.hargaBeliSatuan,
      hargaBeliLama: data.hargaBeliLama.present
          ? data.hargaBeliLama.value
          : this.hargaBeliLama,
      diskonTipe: data.diskonTipe.present
          ? data.diskonTipe.value
          : this.diskonTipe,
      diskonValue: data.diskonValue.present
          ? data.diskonValue.value
          : this.diskonValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingPembelianItemTableData(')
          ..write('id: $id, ')
          ..write('pendingPembelianId: $pendingPembelianId, ')
          ..write('produkId: $produkId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaBeliSatuan: $hargaBeliSatuan, ')
          ..write('hargaBeliLama: $hargaBeliLama, ')
          ..write('diskonTipe: $diskonTipe, ')
          ..write('diskonValue: $diskonValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pendingPembelianId,
    produkId,
    namaProduk,
    jumlah,
    hargaBeliSatuan,
    hargaBeliLama,
    diskonTipe,
    diskonValue,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingPembelianItemTableData &&
          other.id == this.id &&
          other.pendingPembelianId == this.pendingPembelianId &&
          other.produkId == this.produkId &&
          other.namaProduk == this.namaProduk &&
          other.jumlah == this.jumlah &&
          other.hargaBeliSatuan == this.hargaBeliSatuan &&
          other.hargaBeliLama == this.hargaBeliLama &&
          other.diskonTipe == this.diskonTipe &&
          other.diskonValue == this.diskonValue);
}

class PendingPembelianItemTableCompanion
    extends UpdateCompanion<PendingPembelianItemTableData> {
  final Value<int> id;
  final Value<int> pendingPembelianId;
  final Value<int> produkId;
  final Value<String> namaProduk;
  final Value<int> jumlah;
  final Value<double> hargaBeliSatuan;
  final Value<double> hargaBeliLama;
  final Value<int> diskonTipe;
  final Value<double> diskonValue;
  const PendingPembelianItemTableCompanion({
    this.id = const Value.absent(),
    this.pendingPembelianId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.namaProduk = const Value.absent(),
    this.jumlah = const Value.absent(),
    this.hargaBeliSatuan = const Value.absent(),
    this.hargaBeliLama = const Value.absent(),
    this.diskonTipe = const Value.absent(),
    this.diskonValue = const Value.absent(),
  });
  PendingPembelianItemTableCompanion.insert({
    this.id = const Value.absent(),
    required int pendingPembelianId,
    required int produkId,
    required String namaProduk,
    required int jumlah,
    required double hargaBeliSatuan,
    required double hargaBeliLama,
    this.diskonTipe = const Value.absent(),
    this.diskonValue = const Value.absent(),
  }) : pendingPembelianId = Value(pendingPembelianId),
       produkId = Value(produkId),
       namaProduk = Value(namaProduk),
       jumlah = Value(jumlah),
       hargaBeliSatuan = Value(hargaBeliSatuan),
       hargaBeliLama = Value(hargaBeliLama);
  static Insertable<PendingPembelianItemTableData> custom({
    Expression<int>? id,
    Expression<int>? pendingPembelianId,
    Expression<int>? produkId,
    Expression<String>? namaProduk,
    Expression<int>? jumlah,
    Expression<double>? hargaBeliSatuan,
    Expression<double>? hargaBeliLama,
    Expression<int>? diskonTipe,
    Expression<double>? diskonValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pendingPembelianId != null)
        'pending_pembelian_id': pendingPembelianId,
      if (produkId != null) 'produk_id': produkId,
      if (namaProduk != null) 'nama_produk': namaProduk,
      if (jumlah != null) 'jumlah': jumlah,
      if (hargaBeliSatuan != null) 'harga_beli_satuan': hargaBeliSatuan,
      if (hargaBeliLama != null) 'harga_beli_lama': hargaBeliLama,
      if (diskonTipe != null) 'diskon_tipe': diskonTipe,
      if (diskonValue != null) 'diskon_value': diskonValue,
    });
  }

  PendingPembelianItemTableCompanion copyWith({
    Value<int>? id,
    Value<int>? pendingPembelianId,
    Value<int>? produkId,
    Value<String>? namaProduk,
    Value<int>? jumlah,
    Value<double>? hargaBeliSatuan,
    Value<double>? hargaBeliLama,
    Value<int>? diskonTipe,
    Value<double>? diskonValue,
  }) {
    return PendingPembelianItemTableCompanion(
      id: id ?? this.id,
      pendingPembelianId: pendingPembelianId ?? this.pendingPembelianId,
      produkId: produkId ?? this.produkId,
      namaProduk: namaProduk ?? this.namaProduk,
      jumlah: jumlah ?? this.jumlah,
      hargaBeliSatuan: hargaBeliSatuan ?? this.hargaBeliSatuan,
      hargaBeliLama: hargaBeliLama ?? this.hargaBeliLama,
      diskonTipe: diskonTipe ?? this.diskonTipe,
      diskonValue: diskonValue ?? this.diskonValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (pendingPembelianId.present) {
      map['pending_pembelian_id'] = Variable<int>(pendingPembelianId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (namaProduk.present) {
      map['nama_produk'] = Variable<String>(namaProduk.value);
    }
    if (jumlah.present) {
      map['jumlah'] = Variable<int>(jumlah.value);
    }
    if (hargaBeliSatuan.present) {
      map['harga_beli_satuan'] = Variable<double>(hargaBeliSatuan.value);
    }
    if (hargaBeliLama.present) {
      map['harga_beli_lama'] = Variable<double>(hargaBeliLama.value);
    }
    if (diskonTipe.present) {
      map['diskon_tipe'] = Variable<int>(diskonTipe.value);
    }
    if (diskonValue.present) {
      map['diskon_value'] = Variable<double>(diskonValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingPembelianItemTableCompanion(')
          ..write('id: $id, ')
          ..write('pendingPembelianId: $pendingPembelianId, ')
          ..write('produkId: $produkId, ')
          ..write('namaProduk: $namaProduk, ')
          ..write('jumlah: $jumlah, ')
          ..write('hargaBeliSatuan: $hargaBeliSatuan, ')
          ..write('hargaBeliLama: $hargaBeliLama, ')
          ..write('diskonTipe: $diskonTipe, ')
          ..write('diskonValue: $diskonValue')
          ..write(')'))
        .toString();
  }
}

class $SupplierTableTable extends SupplierTable
    with TableInfo<$SupplierTableTable, SupplierTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _teleponMeta = const VerificationMeta(
    'telepon',
  );
  @override
  late final GeneratedColumn<String> telepon = GeneratedColumn<String>(
    'telepon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nama, telepon, alamat, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('telepon')) {
      context.handle(
        _teleponMeta,
        telepon.isAcceptableOrUnknown(data['telepon']!, _teleponMeta),
      );
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      telepon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telepon'],
      ),
      alamat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alamat'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $SupplierTableTable createAlias(String alias) {
    return $SupplierTableTable(attachedDatabase, alias);
  }
}

class SupplierTableData extends DataClass
    implements Insertable<SupplierTableData> {
  final int id;
  final String nama;
  final String? telepon;
  final String? alamat;
  final DateTime createdAt;
  const SupplierTableData({
    required this.id,
    required this.nama,
    this.telepon,
    this.alamat,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || telepon != null) {
      map['telepon'] = Variable<String>(telepon);
    }
    if (!nullToAbsent || alamat != null) {
      map['alamat'] = Variable<String>(alamat);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SupplierTableCompanion toCompanion(bool nullToAbsent) {
    return SupplierTableCompanion(
      id: Value(id),
      nama: Value(nama),
      telepon: telepon == null && nullToAbsent
          ? const Value.absent()
          : Value(telepon),
      alamat: alamat == null && nullToAbsent
          ? const Value.absent()
          : Value(alamat),
      createdAt: Value(createdAt),
    );
  }

  factory SupplierTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierTableData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      telepon: serializer.fromJson<String?>(json['telepon']),
      alamat: serializer.fromJson<String?>(json['alamat']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'telepon': serializer.toJson<String?>(telepon),
      'alamat': serializer.toJson<String?>(alamat),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SupplierTableData copyWith({
    int? id,
    String? nama,
    Value<String?> telepon = const Value.absent(),
    Value<String?> alamat = const Value.absent(),
    DateTime? createdAt,
  }) => SupplierTableData(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    telepon: telepon.present ? telepon.value : this.telepon,
    alamat: alamat.present ? alamat.value : this.alamat,
    createdAt: createdAt ?? this.createdAt,
  );
  SupplierTableData copyWithCompanion(SupplierTableCompanion data) {
    return SupplierTableData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      telepon: data.telepon.present ? data.telepon.value : this.telepon,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTableData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('telepon: $telepon, ')
          ..write('alamat: $alamat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, telepon, alamat, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierTableData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.telepon == this.telepon &&
          other.alamat == this.alamat &&
          other.createdAt == this.createdAt);
}

class SupplierTableCompanion extends UpdateCompanion<SupplierTableData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String?> telepon;
  final Value<String?> alamat;
  final Value<DateTime> createdAt;
  const SupplierTableCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.telepon = const Value.absent(),
    this.alamat = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SupplierTableCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.telepon = const Value.absent(),
    this.alamat = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : nama = Value(nama);
  static Insertable<SupplierTableData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? telepon,
    Expression<String>? alamat,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (telepon != null) 'telepon': telepon,
      if (alamat != null) 'alamat': alamat,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SupplierTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nama,
    Value<String?>? telepon,
    Value<String?>? alamat,
    Value<DateTime>? createdAt,
  }) {
    return SupplierTableCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      telepon: telepon ?? this.telepon,
      alamat: alamat ?? this.alamat,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (telepon.present) {
      map['telepon'] = Variable<String>(telepon.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierTableCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('telepon: $telepon, ')
          ..write('alamat: $alamat, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $NotifikasiTableTable extends NotifikasiTable
    with TableInfo<$NotifikasiTableTable, NotifikasiTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotifikasiTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _judulMeta = const VerificationMeta('judul');
  @override
  late final GeneratedColumn<String> judul = GeneratedColumn<String>(
    'judul',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pesanMeta = const VerificationMeta('pesan');
  @override
  late final GeneratedColumn<String> pesan = GeneratedColumn<String>(
    'pesan',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipeMeta = const VerificationMeta('tipe');
  @override
  late final GeneratedColumn<String> tipe = GeneratedColumn<String>(
    'tipe',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('INFO'),
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    judul,
    pesan,
    tipe,
    isRead,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notifikasi_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotifikasiTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('judul')) {
      context.handle(
        _judulMeta,
        judul.isAcceptableOrUnknown(data['judul']!, _judulMeta),
      );
    } else if (isInserting) {
      context.missing(_judulMeta);
    }
    if (data.containsKey('pesan')) {
      context.handle(
        _pesanMeta,
        pesan.isAcceptableOrUnknown(data['pesan']!, _pesanMeta),
      );
    } else if (isInserting) {
      context.missing(_pesanMeta);
    }
    if (data.containsKey('tipe')) {
      context.handle(
        _tipeMeta,
        tipe.isAcceptableOrUnknown(data['tipe']!, _tipeMeta),
      );
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotifikasiTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotifikasiTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      judul: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}judul'],
      )!,
      pesan: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pesan'],
      )!,
      tipe: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipe'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $NotifikasiTableTable createAlias(String alias) {
    return $NotifikasiTableTable(attachedDatabase, alias);
  }
}

class NotifikasiTableData extends DataClass
    implements Insertable<NotifikasiTableData> {
  final int id;
  final String judul;
  final String pesan;
  final String tipe;
  final bool isRead;
  final DateTime createdAt;
  const NotifikasiTableData({
    required this.id,
    required this.judul,
    required this.pesan,
    required this.tipe,
    required this.isRead,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['judul'] = Variable<String>(judul);
    map['pesan'] = Variable<String>(pesan);
    map['tipe'] = Variable<String>(tipe);
    map['is_read'] = Variable<bool>(isRead);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  NotifikasiTableCompanion toCompanion(bool nullToAbsent) {
    return NotifikasiTableCompanion(
      id: Value(id),
      judul: Value(judul),
      pesan: Value(pesan),
      tipe: Value(tipe),
      isRead: Value(isRead),
      createdAt: Value(createdAt),
    );
  }

  factory NotifikasiTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotifikasiTableData(
      id: serializer.fromJson<int>(json['id']),
      judul: serializer.fromJson<String>(json['judul']),
      pesan: serializer.fromJson<String>(json['pesan']),
      tipe: serializer.fromJson<String>(json['tipe']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'judul': serializer.toJson<String>(judul),
      'pesan': serializer.toJson<String>(pesan),
      'tipe': serializer.toJson<String>(tipe),
      'isRead': serializer.toJson<bool>(isRead),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  NotifikasiTableData copyWith({
    int? id,
    String? judul,
    String? pesan,
    String? tipe,
    bool? isRead,
    DateTime? createdAt,
  }) => NotifikasiTableData(
    id: id ?? this.id,
    judul: judul ?? this.judul,
    pesan: pesan ?? this.pesan,
    tipe: tipe ?? this.tipe,
    isRead: isRead ?? this.isRead,
    createdAt: createdAt ?? this.createdAt,
  );
  NotifikasiTableData copyWithCompanion(NotifikasiTableCompanion data) {
    return NotifikasiTableData(
      id: data.id.present ? data.id.value : this.id,
      judul: data.judul.present ? data.judul.value : this.judul,
      pesan: data.pesan.present ? data.pesan.value : this.pesan,
      tipe: data.tipe.present ? data.tipe.value : this.tipe,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotifikasiTableData(')
          ..write('id: $id, ')
          ..write('judul: $judul, ')
          ..write('pesan: $pesan, ')
          ..write('tipe: $tipe, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, judul, pesan, tipe, isRead, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotifikasiTableData &&
          other.id == this.id &&
          other.judul == this.judul &&
          other.pesan == this.pesan &&
          other.tipe == this.tipe &&
          other.isRead == this.isRead &&
          other.createdAt == this.createdAt);
}

class NotifikasiTableCompanion extends UpdateCompanion<NotifikasiTableData> {
  final Value<int> id;
  final Value<String> judul;
  final Value<String> pesan;
  final Value<String> tipe;
  final Value<bool> isRead;
  final Value<DateTime> createdAt;
  const NotifikasiTableCompanion({
    this.id = const Value.absent(),
    this.judul = const Value.absent(),
    this.pesan = const Value.absent(),
    this.tipe = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  NotifikasiTableCompanion.insert({
    this.id = const Value.absent(),
    required String judul,
    required String pesan,
    this.tipe = const Value.absent(),
    this.isRead = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : judul = Value(judul),
       pesan = Value(pesan);
  static Insertable<NotifikasiTableData> custom({
    Expression<int>? id,
    Expression<String>? judul,
    Expression<String>? pesan,
    Expression<String>? tipe,
    Expression<bool>? isRead,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (judul != null) 'judul': judul,
      if (pesan != null) 'pesan': pesan,
      if (tipe != null) 'tipe': tipe,
      if (isRead != null) 'is_read': isRead,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  NotifikasiTableCompanion copyWith({
    Value<int>? id,
    Value<String>? judul,
    Value<String>? pesan,
    Value<String>? tipe,
    Value<bool>? isRead,
    Value<DateTime>? createdAt,
  }) {
    return NotifikasiTableCompanion(
      id: id ?? this.id,
      judul: judul ?? this.judul,
      pesan: pesan ?? this.pesan,
      tipe: tipe ?? this.tipe,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (judul.present) {
      map['judul'] = Variable<String>(judul.value);
    }
    if (pesan.present) {
      map['pesan'] = Variable<String>(pesan.value);
    }
    if (tipe.present) {
      map['tipe'] = Variable<String>(tipe.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotifikasiTableCompanion(')
          ..write('id: $id, ')
          ..write('judul: $judul, ')
          ..write('pesan: $pesan, ')
          ..write('tipe: $tipe, ')
          ..write('isRead: $isRead, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TokoTableTable extends TokoTable
    with TableInfo<$TokoTableTable, TokoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TokoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _alamatMeta = const VerificationMeta('alamat');
  @override
  late final GeneratedColumn<String> alamat = GeneratedColumn<String>(
    'alamat',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _teleponMeta = const VerificationMeta(
    'telepon',
  );
  @override
  late final GeneratedColumn<String> telepon = GeneratedColumn<String>(
    'telepon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nama, alamat, telepon, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'toko_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<TokoTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('alamat')) {
      context.handle(
        _alamatMeta,
        alamat.isAcceptableOrUnknown(data['alamat']!, _alamatMeta),
      );
    }
    if (data.containsKey('telepon')) {
      context.handle(
        _teleponMeta,
        telepon.isAcceptableOrUnknown(data['telepon']!, _teleponMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TokoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TokoTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      alamat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alamat'],
      ),
      telepon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telepon'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $TokoTableTable createAlias(String alias) {
    return $TokoTableTable(attachedDatabase, alias);
  }
}

class TokoTableData extends DataClass implements Insertable<TokoTableData> {
  final int id;
  final String nama;
  final String? alamat;
  final String? telepon;
  final DateTime createdAt;
  const TokoTableData({
    required this.id,
    required this.nama,
    this.alamat,
    this.telepon,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    if (!nullToAbsent || alamat != null) {
      map['alamat'] = Variable<String>(alamat);
    }
    if (!nullToAbsent || telepon != null) {
      map['telepon'] = Variable<String>(telepon);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  TokoTableCompanion toCompanion(bool nullToAbsent) {
    return TokoTableCompanion(
      id: Value(id),
      nama: Value(nama),
      alamat: alamat == null && nullToAbsent
          ? const Value.absent()
          : Value(alamat),
      telepon: telepon == null && nullToAbsent
          ? const Value.absent()
          : Value(telepon),
      createdAt: Value(createdAt),
    );
  }

  factory TokoTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TokoTableData(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      alamat: serializer.fromJson<String?>(json['alamat']),
      telepon: serializer.fromJson<String?>(json['telepon']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'alamat': serializer.toJson<String?>(alamat),
      'telepon': serializer.toJson<String?>(telepon),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  TokoTableData copyWith({
    int? id,
    String? nama,
    Value<String?> alamat = const Value.absent(),
    Value<String?> telepon = const Value.absent(),
    DateTime? createdAt,
  }) => TokoTableData(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    alamat: alamat.present ? alamat.value : this.alamat,
    telepon: telepon.present ? telepon.value : this.telepon,
    createdAt: createdAt ?? this.createdAt,
  );
  TokoTableData copyWithCompanion(TokoTableCompanion data) {
    return TokoTableData(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      alamat: data.alamat.present ? data.alamat.value : this.alamat,
      telepon: data.telepon.present ? data.telepon.value : this.telepon,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TokoTableData(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('alamat: $alamat, ')
          ..write('telepon: $telepon, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nama, alamat, telepon, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TokoTableData &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.alamat == this.alamat &&
          other.telepon == this.telepon &&
          other.createdAt == this.createdAt);
}

class TokoTableCompanion extends UpdateCompanion<TokoTableData> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String?> alamat;
  final Value<String?> telepon;
  final Value<DateTime> createdAt;
  const TokoTableCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.alamat = const Value.absent(),
    this.telepon = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TokoTableCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    this.alamat = const Value.absent(),
    this.telepon = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : nama = Value(nama);
  static Insertable<TokoTableData> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? alamat,
    Expression<String>? telepon,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (alamat != null) 'alamat': alamat,
      if (telepon != null) 'telepon': telepon,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TokoTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nama,
    Value<String?>? alamat,
    Value<String?>? telepon,
    Value<DateTime>? createdAt,
  }) {
    return TokoTableCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      alamat: alamat ?? this.alamat,
      telepon: telepon ?? this.telepon,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (alamat.present) {
      map['alamat'] = Variable<String>(alamat.value);
    }
    if (telepon.present) {
      map['telepon'] = Variable<String>(telepon.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokoTableCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('alamat: $alamat, ')
          ..write('telepon: $telepon, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usernameMeta = const VerificationMeta(
    'username',
  );
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
    'username',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _tokoIdMeta = const VerificationMeta('tokoId');
  @override
  late final GeneratedColumn<int> tokoId = GeneratedColumn<int>(
    'toko_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    username,
    password,
    role,
    nama,
    email,
    tokoId,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(
        _usernameMeta,
        username.isAcceptableOrUnknown(data['username']!, _usernameMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('toko_id')) {
      context.handle(
        _tokoIdMeta,
        tokoId.isAcceptableOrUnknown(data['toko_id']!, _tokoIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      username: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}username'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      tokoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}toko_id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserTableData extends DataClass implements Insertable<UserTableData> {
  final int id;
  final String? username;
  final String password;
  final String role;
  final String? nama;
  final String? email;
  final int tokoId;
  final DateTime createdAt;
  const UserTableData({
    required this.id,
    this.username,
    required this.password,
    required this.role,
    this.nama,
    this.email,
    required this.tokoId,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || username != null) {
      map['username'] = Variable<String>(username);
    }
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || nama != null) {
      map['nama'] = Variable<String>(nama);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['toko_id'] = Variable<int>(tokoId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      username: username == null && nullToAbsent
          ? const Value.absent()
          : Value(username),
      password: Value(password),
      role: Value(role),
      nama: nama == null && nullToAbsent ? const Value.absent() : Value(nama),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      tokoId: Value(tokoId),
      createdAt: Value(createdAt),
    );
  }

  factory UserTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserTableData(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String?>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      nama: serializer.fromJson<String?>(json['nama']),
      email: serializer.fromJson<String?>(json['email']),
      tokoId: serializer.fromJson<int>(json['tokoId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String?>(username),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
      'nama': serializer.toJson<String?>(nama),
      'email': serializer.toJson<String?>(email),
      'tokoId': serializer.toJson<int>(tokoId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserTableData copyWith({
    int? id,
    Value<String?> username = const Value.absent(),
    String? password,
    String? role,
    Value<String?> nama = const Value.absent(),
    Value<String?> email = const Value.absent(),
    int? tokoId,
    DateTime? createdAt,
  }) => UserTableData(
    id: id ?? this.id,
    username: username.present ? username.value : this.username,
    password: password ?? this.password,
    role: role ?? this.role,
    nama: nama.present ? nama.value : this.nama,
    email: email.present ? email.value : this.email,
    tokoId: tokoId ?? this.tokoId,
    createdAt: createdAt ?? this.createdAt,
  );
  UserTableData copyWithCompanion(UserTableCompanion data) {
    return UserTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
      nama: data.nama.present ? data.nama.value : this.nama,
      email: data.email.present ? data.email.value : this.email,
      tokoId: data.tokoId.present ? data.tokoId.value : this.tokoId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('nama: $nama, ')
          ..write('email: $email, ')
          ..write('tokoId: $tokoId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, username, password, role, nama, email, tokoId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.role == this.role &&
          other.nama == this.nama &&
          other.email == this.email &&
          other.tokoId == this.tokoId &&
          other.createdAt == this.createdAt);
}

class UserTableCompanion extends UpdateCompanion<UserTableData> {
  final Value<int> id;
  final Value<String?> username;
  final Value<String> password;
  final Value<String> role;
  final Value<String?> nama;
  final Value<String?> email;
  final Value<int> tokoId;
  final Value<DateTime> createdAt;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.nama = const Value.absent(),
    this.email = const Value.absent(),
    this.tokoId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UserTableCompanion.insert({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    required String password,
    required String role,
    this.nama = const Value.absent(),
    this.email = const Value.absent(),
    this.tokoId = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : password = Value(password),
       role = Value(role);
  static Insertable<UserTableData> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? role,
    Expression<String>? nama,
    Expression<String>? email,
    Expression<int>? tokoId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (nama != null) 'nama': nama,
      if (email != null) 'email': email,
      if (tokoId != null) 'toko_id': tokoId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UserTableCompanion copyWith({
    Value<int>? id,
    Value<String?>? username,
    Value<String>? password,
    Value<String>? role,
    Value<String?>? nama,
    Value<String?>? email,
    Value<int>? tokoId,
    Value<DateTime>? createdAt,
  }) {
    return UserTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      role: role ?? this.role,
      nama: nama ?? this.nama,
      email: email ?? this.email,
      tokoId: tokoId ?? this.tokoId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (tokoId.present) {
      map['toko_id'] = Variable<int>(tokoId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('nama: $nama, ')
          ..write('email: $email, ')
          ..write('tokoId: $tokoId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SyncRecordTableTable extends SyncRecordTable
    with TableInfo<$SyncRecordTableTable, SyncRecordTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncRecordTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tableEntityMeta = const VerificationMeta(
    'tableEntity',
  );
  @override
  late final GeneratedColumn<String> tableEntity = GeneratedColumn<String>(
    'table_entity',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localIdMeta = const VerificationMeta(
    'localId',
  );
  @override
  late final GeneratedColumn<int> localId = GeneratedColumn<int>(
    'local_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _syncStatusMeta = const VerificationMeta(
    'syncStatus',
  );
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
    'sync_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _tokoIdMeta = const VerificationMeta('tokoId');
  @override
  late final GeneratedColumn<int> tokoId = GeneratedColumn<int>(
    'toko_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    tableEntity,
    localId,
    updatedAt,
    isDeleted,
    syncStatus,
    tokoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_record_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SyncRecordTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('table_entity')) {
      context.handle(
        _tableEntityMeta,
        tableEntity.isAcceptableOrUnknown(
          data['table_entity']!,
          _tableEntityMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tableEntityMeta);
    }
    if (data.containsKey('local_id')) {
      context.handle(
        _localIdMeta,
        localId.isAcceptableOrUnknown(data['local_id']!, _localIdMeta),
      );
    } else if (isInserting) {
      context.missing(_localIdMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('sync_status')) {
      context.handle(
        _syncStatusMeta,
        syncStatus.isAcceptableOrUnknown(data['sync_status']!, _syncStatusMeta),
      );
    }
    if (data.containsKey('toko_id')) {
      context.handle(
        _tokoIdMeta,
        tokoId.isAcceptableOrUnknown(data['toko_id']!, _tokoIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  SyncRecordTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncRecordTableData(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      tableEntity: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}table_entity'],
      )!,
      localId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}local_id'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      syncStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sync_status'],
      )!,
      tokoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}toko_id'],
      )!,
    );
  }

  @override
  $SyncRecordTableTable createAlias(String alias) {
    return $SyncRecordTableTable(attachedDatabase, alias);
  }
}

class SyncRecordTableData extends DataClass
    implements Insertable<SyncRecordTableData> {
  final String uuid;
  final String tableEntity;
  final int localId;
  final int updatedAt;
  final bool isDeleted;
  final String syncStatus;
  final int tokoId;
  const SyncRecordTableData({
    required this.uuid,
    required this.tableEntity,
    required this.localId,
    required this.updatedAt,
    required this.isDeleted,
    required this.syncStatus,
    required this.tokoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['table_entity'] = Variable<String>(tableEntity);
    map['local_id'] = Variable<int>(localId);
    map['updated_at'] = Variable<int>(updatedAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['sync_status'] = Variable<String>(syncStatus);
    map['toko_id'] = Variable<int>(tokoId);
    return map;
  }

  SyncRecordTableCompanion toCompanion(bool nullToAbsent) {
    return SyncRecordTableCompanion(
      uuid: Value(uuid),
      tableEntity: Value(tableEntity),
      localId: Value(localId),
      updatedAt: Value(updatedAt),
      isDeleted: Value(isDeleted),
      syncStatus: Value(syncStatus),
      tokoId: Value(tokoId),
    );
  }

  factory SyncRecordTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncRecordTableData(
      uuid: serializer.fromJson<String>(json['uuid']),
      tableEntity: serializer.fromJson<String>(json['tableEntity']),
      localId: serializer.fromJson<int>(json['localId']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      tokoId: serializer.fromJson<int>(json['tokoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'tableEntity': serializer.toJson<String>(tableEntity),
      'localId': serializer.toJson<int>(localId),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'tokoId': serializer.toJson<int>(tokoId),
    };
  }

  SyncRecordTableData copyWith({
    String? uuid,
    String? tableEntity,
    int? localId,
    int? updatedAt,
    bool? isDeleted,
    String? syncStatus,
    int? tokoId,
  }) => SyncRecordTableData(
    uuid: uuid ?? this.uuid,
    tableEntity: tableEntity ?? this.tableEntity,
    localId: localId ?? this.localId,
    updatedAt: updatedAt ?? this.updatedAt,
    isDeleted: isDeleted ?? this.isDeleted,
    syncStatus: syncStatus ?? this.syncStatus,
    tokoId: tokoId ?? this.tokoId,
  );
  SyncRecordTableData copyWithCompanion(SyncRecordTableCompanion data) {
    return SyncRecordTableData(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      tableEntity: data.tableEntity.present
          ? data.tableEntity.value
          : this.tableEntity,
      localId: data.localId.present ? data.localId.value : this.localId,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      syncStatus: data.syncStatus.present
          ? data.syncStatus.value
          : this.syncStatus,
      tokoId: data.tokoId.present ? data.tokoId.value : this.tokoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecordTableData(')
          ..write('uuid: $uuid, ')
          ..write('tableEntity: $tableEntity, ')
          ..write('localId: $localId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('tokoId: $tokoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    tableEntity,
    localId,
    updatedAt,
    isDeleted,
    syncStatus,
    tokoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncRecordTableData &&
          other.uuid == this.uuid &&
          other.tableEntity == this.tableEntity &&
          other.localId == this.localId &&
          other.updatedAt == this.updatedAt &&
          other.isDeleted == this.isDeleted &&
          other.syncStatus == this.syncStatus &&
          other.tokoId == this.tokoId);
}

class SyncRecordTableCompanion extends UpdateCompanion<SyncRecordTableData> {
  final Value<String> uuid;
  final Value<String> tableEntity;
  final Value<int> localId;
  final Value<int> updatedAt;
  final Value<bool> isDeleted;
  final Value<String> syncStatus;
  final Value<int> tokoId;
  final Value<int> rowid;
  const SyncRecordTableCompanion({
    this.uuid = const Value.absent(),
    this.tableEntity = const Value.absent(),
    this.localId = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.tokoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncRecordTableCompanion.insert({
    required String uuid,
    required String tableEntity,
    required int localId,
    required int updatedAt,
    this.isDeleted = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.tokoId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       tableEntity = Value(tableEntity),
       localId = Value(localId),
       updatedAt = Value(updatedAt);
  static Insertable<SyncRecordTableData> custom({
    Expression<String>? uuid,
    Expression<String>? tableEntity,
    Expression<int>? localId,
    Expression<int>? updatedAt,
    Expression<bool>? isDeleted,
    Expression<String>? syncStatus,
    Expression<int>? tokoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (tableEntity != null) 'table_entity': tableEntity,
      if (localId != null) 'local_id': localId,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (tokoId != null) 'toko_id': tokoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncRecordTableCompanion copyWith({
    Value<String>? uuid,
    Value<String>? tableEntity,
    Value<int>? localId,
    Value<int>? updatedAt,
    Value<bool>? isDeleted,
    Value<String>? syncStatus,
    Value<int>? tokoId,
    Value<int>? rowid,
  }) {
    return SyncRecordTableCompanion(
      uuid: uuid ?? this.uuid,
      tableEntity: tableEntity ?? this.tableEntity,
      localId: localId ?? this.localId,
      updatedAt: updatedAt ?? this.updatedAt,
      isDeleted: isDeleted ?? this.isDeleted,
      syncStatus: syncStatus ?? this.syncStatus,
      tokoId: tokoId ?? this.tokoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (tableEntity.present) {
      map['table_entity'] = Variable<String>(tableEntity.value);
    }
    if (localId.present) {
      map['local_id'] = Variable<int>(localId.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (tokoId.present) {
      map['toko_id'] = Variable<int>(tokoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncRecordTableCompanion(')
          ..write('uuid: $uuid, ')
          ..write('tableEntity: $tableEntity, ')
          ..write('localId: $localId, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('tokoId: $tokoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SupplierProductsTableTable extends SupplierProductsTable
    with TableInfo<$SupplierProductsTableTable, SupplierProductsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SupplierProductsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _supplierIdMeta = const VerificationMeta(
    'supplierId',
  );
  @override
  late final GeneratedColumn<int> supplierId = GeneratedColumn<int>(
    'supplier_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES supplier_table (id)',
    ),
  );
  static const VerificationMeta _produkIdMeta = const VerificationMeta(
    'produkId',
  );
  @override
  late final GeneratedColumn<int> produkId = GeneratedColumn<int>(
    'produk_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES produk_table (id)',
    ),
  );
  static const VerificationMeta _lastPriceMeta = const VerificationMeta(
    'lastPrice',
  );
  @override
  late final GeneratedColumn<double> lastPrice = GeneratedColumn<double>(
    'last_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    supplierId,
    produkId,
    lastPrice,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'supplier_products_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SupplierProductsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
        _supplierIdMeta,
        supplierId.isAcceptableOrUnknown(data['supplier_id']!, _supplierIdMeta),
      );
    } else if (isInserting) {
      context.missing(_supplierIdMeta);
    }
    if (data.containsKey('produk_id')) {
      context.handle(
        _produkIdMeta,
        produkId.isAcceptableOrUnknown(data['produk_id']!, _produkIdMeta),
      );
    } else if (isInserting) {
      context.missing(_produkIdMeta);
    }
    if (data.containsKey('last_price')) {
      context.handle(
        _lastPriceMeta,
        lastPrice.isAcceptableOrUnknown(data['last_price']!, _lastPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_lastPriceMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SupplierProductsTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SupplierProductsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      supplierId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supplier_id'],
      )!,
      produkId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}produk_id'],
      )!,
      lastPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}last_price'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SupplierProductsTableTable createAlias(String alias) {
    return $SupplierProductsTableTable(attachedDatabase, alias);
  }
}

class SupplierProductsTableData extends DataClass
    implements Insertable<SupplierProductsTableData> {
  final int id;
  final int supplierId;
  final int produkId;
  final double lastPrice;
  final DateTime updatedAt;
  const SupplierProductsTableData({
    required this.id,
    required this.supplierId,
    required this.produkId,
    required this.lastPrice,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['supplier_id'] = Variable<int>(supplierId);
    map['produk_id'] = Variable<int>(produkId);
    map['last_price'] = Variable<double>(lastPrice);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SupplierProductsTableCompanion toCompanion(bool nullToAbsent) {
    return SupplierProductsTableCompanion(
      id: Value(id),
      supplierId: Value(supplierId),
      produkId: Value(produkId),
      lastPrice: Value(lastPrice),
      updatedAt: Value(updatedAt),
    );
  }

  factory SupplierProductsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SupplierProductsTableData(
      id: serializer.fromJson<int>(json['id']),
      supplierId: serializer.fromJson<int>(json['supplierId']),
      produkId: serializer.fromJson<int>(json['produkId']),
      lastPrice: serializer.fromJson<double>(json['lastPrice']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'supplierId': serializer.toJson<int>(supplierId),
      'produkId': serializer.toJson<int>(produkId),
      'lastPrice': serializer.toJson<double>(lastPrice),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  SupplierProductsTableData copyWith({
    int? id,
    int? supplierId,
    int? produkId,
    double? lastPrice,
    DateTime? updatedAt,
  }) => SupplierProductsTableData(
    id: id ?? this.id,
    supplierId: supplierId ?? this.supplierId,
    produkId: produkId ?? this.produkId,
    lastPrice: lastPrice ?? this.lastPrice,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  SupplierProductsTableData copyWithCompanion(
    SupplierProductsTableCompanion data,
  ) {
    return SupplierProductsTableData(
      id: data.id.present ? data.id.value : this.id,
      supplierId: data.supplierId.present
          ? data.supplierId.value
          : this.supplierId,
      produkId: data.produkId.present ? data.produkId.value : this.produkId,
      lastPrice: data.lastPrice.present ? data.lastPrice.value : this.lastPrice,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SupplierProductsTableData(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('produkId: $produkId, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, supplierId, produkId, lastPrice, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SupplierProductsTableData &&
          other.id == this.id &&
          other.supplierId == this.supplierId &&
          other.produkId == this.produkId &&
          other.lastPrice == this.lastPrice &&
          other.updatedAt == this.updatedAt);
}

class SupplierProductsTableCompanion
    extends UpdateCompanion<SupplierProductsTableData> {
  final Value<int> id;
  final Value<int> supplierId;
  final Value<int> produkId;
  final Value<double> lastPrice;
  final Value<DateTime> updatedAt;
  const SupplierProductsTableCompanion({
    this.id = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.produkId = const Value.absent(),
    this.lastPrice = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  SupplierProductsTableCompanion.insert({
    this.id = const Value.absent(),
    required int supplierId,
    required int produkId,
    required double lastPrice,
    required DateTime updatedAt,
  }) : supplierId = Value(supplierId),
       produkId = Value(produkId),
       lastPrice = Value(lastPrice),
       updatedAt = Value(updatedAt);
  static Insertable<SupplierProductsTableData> custom({
    Expression<int>? id,
    Expression<int>? supplierId,
    Expression<int>? produkId,
    Expression<double>? lastPrice,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (supplierId != null) 'supplier_id': supplierId,
      if (produkId != null) 'produk_id': produkId,
      if (lastPrice != null) 'last_price': lastPrice,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  SupplierProductsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? supplierId,
    Value<int>? produkId,
    Value<double>? lastPrice,
    Value<DateTime>? updatedAt,
  }) {
    return SupplierProductsTableCompanion(
      id: id ?? this.id,
      supplierId: supplierId ?? this.supplierId,
      produkId: produkId ?? this.produkId,
      lastPrice: lastPrice ?? this.lastPrice,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<int>(supplierId.value);
    }
    if (produkId.present) {
      map['produk_id'] = Variable<int>(produkId.value);
    }
    if (lastPrice.present) {
      map['last_price'] = Variable<double>(lastPrice.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SupplierProductsTableCompanion(')
          ..write('id: $id, ')
          ..write('supplierId: $supplierId, ')
          ..write('produkId: $produkId, ')
          ..write('lastPrice: $lastPrice, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProdukTableTable produkTable = $ProdukTableTable(this);
  late final $SatuanProdukTableTable satuanProdukTable =
      $SatuanProdukTableTable(this);
  late final $TransaksiTableTable transaksiTable = $TransaksiTableTable(this);
  late final $ItemTransaksiTableTable itemTransaksiTable =
      $ItemTransaksiTableTable(this);
  late final $HutangPiutangTableTable hutangPiutangTable =
      $HutangPiutangTableTable(this);
  late final $RiwayatStokTableTable riwayatStokTable = $RiwayatStokTableTable(
    this,
  );
  late final $PembelianTableTable pembelianTable = $PembelianTableTable(this);
  late final $ItemPembelianTableTable itemPembelianTable =
      $ItemPembelianTableTable(this);
  late final $PendingOrderTableTable pendingOrderTable =
      $PendingOrderTableTable(this);
  late final $PendingOrderItemTableTable pendingOrderItemTable =
      $PendingOrderItemTableTable(this);
  late final $PendingPembelianTableTable pendingPembelianTable =
      $PendingPembelianTableTable(this);
  late final $PendingPembelianItemTableTable pendingPembelianItemTable =
      $PendingPembelianItemTableTable(this);
  late final $SupplierTableTable supplierTable = $SupplierTableTable(this);
  late final $NotifikasiTableTable notifikasiTable = $NotifikasiTableTable(
    this,
  );
  late final $TokoTableTable tokoTable = $TokoTableTable(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $SyncRecordTableTable syncRecordTable = $SyncRecordTableTable(
    this,
  );
  late final $SupplierProductsTableTable supplierProductsTable =
      $SupplierProductsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    produkTable,
    satuanProdukTable,
    transaksiTable,
    itemTransaksiTable,
    hutangPiutangTable,
    riwayatStokTable,
    pembelianTable,
    itemPembelianTable,
    pendingOrderTable,
    pendingOrderItemTable,
    pendingPembelianTable,
    pendingPembelianItemTable,
    supplierTable,
    notifikasiTable,
    tokoTable,
    userTable,
    syncRecordTable,
    supplierProductsTable,
  ];
}

typedef $$ProdukTableTableCreateCompanionBuilder =
    ProdukTableCompanion Function({
      Value<int> id,
      required String nama,
      Value<String?> barcode,
      required double hargaBeli,
      required double hargaJual,
      Value<int> stok,
      Value<String?> kategori,
      Value<String> satuan,
      Value<DateTime> createdAt,
    });
typedef $$ProdukTableTableUpdateCompanionBuilder =
    ProdukTableCompanion Function({
      Value<int> id,
      Value<String> nama,
      Value<String?> barcode,
      Value<double> hargaBeli,
      Value<double> hargaJual,
      Value<int> stok,
      Value<String?> kategori,
      Value<String> satuan,
      Value<DateTime> createdAt,
    });

final class $$ProdukTableTableReferences
    extends BaseReferences<_$AppDatabase, $ProdukTableTable, ProdukTableData> {
  $$ProdukTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $SupplierProductsTableTable,
    List<SupplierProductsTableData>
  >
  _supplierProductsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.supplierProductsTable,
        aliasName: $_aliasNameGenerator(
          db.produkTable.id,
          db.supplierProductsTable.produkId,
        ),
      );

  $$SupplierProductsTableTableProcessedTableManager
  get supplierProductsTableRefs {
    final manager = $$SupplierProductsTableTableTableManager(
      $_db,
      $_db.supplierProductsTable,
    ).filter((f) => f.produkId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _supplierProductsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ProdukTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProdukTableTable> {
  $$ProdukTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaBeli => $composableBuilder(
    column: $table.hargaBeli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stok => $composableBuilder(
    column: $table.stok,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get satuan => $composableBuilder(
    column: $table.satuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplierProductsTableRefs(
    Expression<bool> Function($$SupplierProductsTableTableFilterComposer f) f,
  ) {
    final $$SupplierProductsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierProductsTable,
          getReferencedColumn: (t) => t.produkId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierProductsTableTableFilterComposer(
                $db: $db,
                $table: $db.supplierProductsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProdukTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProdukTableTable> {
  $$ProdukTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get barcode => $composableBuilder(
    column: $table.barcode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaBeli => $composableBuilder(
    column: $table.hargaBeli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stok => $composableBuilder(
    column: $table.stok,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kategori => $composableBuilder(
    column: $table.kategori,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get satuan => $composableBuilder(
    column: $table.satuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProdukTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProdukTableTable> {
  $$ProdukTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<double> get hargaBeli =>
      $composableBuilder(column: $table.hargaBeli, builder: (column) => column);

  GeneratedColumn<double> get hargaJual =>
      $composableBuilder(column: $table.hargaJual, builder: (column) => column);

  GeneratedColumn<int> get stok =>
      $composableBuilder(column: $table.stok, builder: (column) => column);

  GeneratedColumn<String> get kategori =>
      $composableBuilder(column: $table.kategori, builder: (column) => column);

  GeneratedColumn<String> get satuan =>
      $composableBuilder(column: $table.satuan, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> supplierProductsTableRefs<T extends Object>(
    Expression<T> Function($$SupplierProductsTableTableAnnotationComposer a) f,
  ) {
    final $$SupplierProductsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierProductsTable,
          getReferencedColumn: (t) => t.produkId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierProductsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.supplierProductsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$ProdukTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProdukTableTable,
          ProdukTableData,
          $$ProdukTableTableFilterComposer,
          $$ProdukTableTableOrderingComposer,
          $$ProdukTableTableAnnotationComposer,
          $$ProdukTableTableCreateCompanionBuilder,
          $$ProdukTableTableUpdateCompanionBuilder,
          (ProdukTableData, $$ProdukTableTableReferences),
          ProdukTableData,
          PrefetchHooks Function({bool supplierProductsTableRefs})
        > {
  $$ProdukTableTableTableManager(_$AppDatabase db, $ProdukTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProdukTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProdukTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProdukTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String?> barcode = const Value.absent(),
                Value<double> hargaBeli = const Value.absent(),
                Value<double> hargaJual = const Value.absent(),
                Value<int> stok = const Value.absent(),
                Value<String?> kategori = const Value.absent(),
                Value<String> satuan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProdukTableCompanion(
                id: id,
                nama: nama,
                barcode: barcode,
                hargaBeli: hargaBeli,
                hargaJual: hargaJual,
                stok: stok,
                kategori: kategori,
                satuan: satuan,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nama,
                Value<String?> barcode = const Value.absent(),
                required double hargaBeli,
                required double hargaJual,
                Value<int> stok = const Value.absent(),
                Value<String?> kategori = const Value.absent(),
                Value<String> satuan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ProdukTableCompanion.insert(
                id: id,
                nama: nama,
                barcode: barcode,
                hargaBeli: hargaBeli,
                hargaJual: hargaJual,
                stok: stok,
                kategori: kategori,
                satuan: satuan,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProdukTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierProductsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (supplierProductsTableRefs) db.supplierProductsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (supplierProductsTableRefs)
                    await $_getPrefetchedData<
                      ProdukTableData,
                      $ProdukTableTable,
                      SupplierProductsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$ProdukTableTableReferences
                          ._supplierProductsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProdukTableTableReferences(
                            db,
                            table,
                            p0,
                          ).supplierProductsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.produkId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ProdukTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProdukTableTable,
      ProdukTableData,
      $$ProdukTableTableFilterComposer,
      $$ProdukTableTableOrderingComposer,
      $$ProdukTableTableAnnotationComposer,
      $$ProdukTableTableCreateCompanionBuilder,
      $$ProdukTableTableUpdateCompanionBuilder,
      (ProdukTableData, $$ProdukTableTableReferences),
      ProdukTableData,
      PrefetchHooks Function({bool supplierProductsTableRefs})
    >;
typedef $$SatuanProdukTableTableCreateCompanionBuilder =
    SatuanProdukTableCompanion Function({
      Value<int> id,
      required int produkId,
      required String nama,
      required double konversi,
      required double hargaBeli,
      required double hargaJual,
    });
typedef $$SatuanProdukTableTableUpdateCompanionBuilder =
    SatuanProdukTableCompanion Function({
      Value<int> id,
      Value<int> produkId,
      Value<String> nama,
      Value<double> konversi,
      Value<double> hargaBeli,
      Value<double> hargaJual,
    });

class $$SatuanProdukTableTableFilterComposer
    extends Composer<_$AppDatabase, $SatuanProdukTableTable> {
  $$SatuanProdukTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get konversi => $composableBuilder(
    column: $table.konversi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaBeli => $composableBuilder(
    column: $table.hargaBeli,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SatuanProdukTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SatuanProdukTableTable> {
  $$SatuanProdukTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get konversi => $composableBuilder(
    column: $table.konversi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaBeli => $composableBuilder(
    column: $table.hargaBeli,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SatuanProdukTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SatuanProdukTableTable> {
  $$SatuanProdukTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<double> get konversi =>
      $composableBuilder(column: $table.konversi, builder: (column) => column);

  GeneratedColumn<double> get hargaBeli =>
      $composableBuilder(column: $table.hargaBeli, builder: (column) => column);

  GeneratedColumn<double> get hargaJual =>
      $composableBuilder(column: $table.hargaJual, builder: (column) => column);
}

class $$SatuanProdukTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SatuanProdukTableTable,
          SatuanProdukTableData,
          $$SatuanProdukTableTableFilterComposer,
          $$SatuanProdukTableTableOrderingComposer,
          $$SatuanProdukTableTableAnnotationComposer,
          $$SatuanProdukTableTableCreateCompanionBuilder,
          $$SatuanProdukTableTableUpdateCompanionBuilder,
          (
            SatuanProdukTableData,
            BaseReferences<
              _$AppDatabase,
              $SatuanProdukTableTable,
              SatuanProdukTableData
            >,
          ),
          SatuanProdukTableData,
          PrefetchHooks Function()
        > {
  $$SatuanProdukTableTableTableManager(
    _$AppDatabase db,
    $SatuanProdukTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SatuanProdukTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SatuanProdukTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SatuanProdukTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<double> konversi = const Value.absent(),
                Value<double> hargaBeli = const Value.absent(),
                Value<double> hargaJual = const Value.absent(),
              }) => SatuanProdukTableCompanion(
                id: id,
                produkId: produkId,
                nama: nama,
                konversi: konversi,
                hargaBeli: hargaBeli,
                hargaJual: hargaJual,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int produkId,
                required String nama,
                required double konversi,
                required double hargaBeli,
                required double hargaJual,
              }) => SatuanProdukTableCompanion.insert(
                id: id,
                produkId: produkId,
                nama: nama,
                konversi: konversi,
                hargaBeli: hargaBeli,
                hargaJual: hargaJual,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SatuanProdukTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SatuanProdukTableTable,
      SatuanProdukTableData,
      $$SatuanProdukTableTableFilterComposer,
      $$SatuanProdukTableTableOrderingComposer,
      $$SatuanProdukTableTableAnnotationComposer,
      $$SatuanProdukTableTableCreateCompanionBuilder,
      $$SatuanProdukTableTableUpdateCompanionBuilder,
      (
        SatuanProdukTableData,
        BaseReferences<
          _$AppDatabase,
          $SatuanProdukTableTable,
          SatuanProdukTableData
        >,
      ),
      SatuanProdukTableData,
      PrefetchHooks Function()
    >;
typedef $$TransaksiTableTableCreateCompanionBuilder =
    TransaksiTableCompanion Function({
      Value<int> id,
      required double totalHarga,
      required double jumlahBayar,
      required double kembalian,
      Value<String> status,
      Value<int?> pelangganId,
      Value<DateTime> createdAt,
    });
typedef $$TransaksiTableTableUpdateCompanionBuilder =
    TransaksiTableCompanion Function({
      Value<int> id,
      Value<double> totalHarga,
      Value<double> jumlahBayar,
      Value<double> kembalian,
      Value<String> status,
      Value<int?> pelangganId,
      Value<DateTime> createdAt,
    });

class $$TransaksiTableTableFilterComposer
    extends Composer<_$AppDatabase, $TransaksiTableTable> {
  $$TransaksiTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get kembalian => $composableBuilder(
    column: $table.kembalian,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pelangganId => $composableBuilder(
    column: $table.pelangganId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TransaksiTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TransaksiTableTable> {
  $$TransaksiTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get kembalian => $composableBuilder(
    column: $table.kembalian,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pelangganId => $composableBuilder(
    column: $table.pelangganId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TransaksiTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransaksiTableTable> {
  $$TransaksiTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => column,
  );

  GeneratedColumn<double> get jumlahBayar => $composableBuilder(
    column: $table.jumlahBayar,
    builder: (column) => column,
  );

  GeneratedColumn<double> get kembalian =>
      $composableBuilder(column: $table.kembalian, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get pelangganId => $composableBuilder(
    column: $table.pelangganId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TransaksiTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TransaksiTableTable,
          TransaksiTableData,
          $$TransaksiTableTableFilterComposer,
          $$TransaksiTableTableOrderingComposer,
          $$TransaksiTableTableAnnotationComposer,
          $$TransaksiTableTableCreateCompanionBuilder,
          $$TransaksiTableTableUpdateCompanionBuilder,
          (
            TransaksiTableData,
            BaseReferences<
              _$AppDatabase,
              $TransaksiTableTable,
              TransaksiTableData
            >,
          ),
          TransaksiTableData,
          PrefetchHooks Function()
        > {
  $$TransaksiTableTableTableManager(
    _$AppDatabase db,
    $TransaksiTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransaksiTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransaksiTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransaksiTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> totalHarga = const Value.absent(),
                Value<double> jumlahBayar = const Value.absent(),
                Value<double> kembalian = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> pelangganId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransaksiTableCompanion(
                id: id,
                totalHarga: totalHarga,
                jumlahBayar: jumlahBayar,
                kembalian: kembalian,
                status: status,
                pelangganId: pelangganId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double totalHarga,
                required double jumlahBayar,
                required double kembalian,
                Value<String> status = const Value.absent(),
                Value<int?> pelangganId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TransaksiTableCompanion.insert(
                id: id,
                totalHarga: totalHarga,
                jumlahBayar: jumlahBayar,
                kembalian: kembalian,
                status: status,
                pelangganId: pelangganId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TransaksiTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TransaksiTableTable,
      TransaksiTableData,
      $$TransaksiTableTableFilterComposer,
      $$TransaksiTableTableOrderingComposer,
      $$TransaksiTableTableAnnotationComposer,
      $$TransaksiTableTableCreateCompanionBuilder,
      $$TransaksiTableTableUpdateCompanionBuilder,
      (
        TransaksiTableData,
        BaseReferences<_$AppDatabase, $TransaksiTableTable, TransaksiTableData>,
      ),
      TransaksiTableData,
      PrefetchHooks Function()
    >;
typedef $$ItemTransaksiTableTableCreateCompanionBuilder =
    ItemTransaksiTableCompanion Function({
      Value<int> id,
      required int transaksiId,
      required int produkId,
      required int jumlah,
      required double hargaSatuan,
      required double subtotal,
    });
typedef $$ItemTransaksiTableTableUpdateCompanionBuilder =
    ItemTransaksiTableCompanion Function({
      Value<int> id,
      Value<int> transaksiId,
      Value<int> produkId,
      Value<int> jumlah,
      Value<double> hargaSatuan,
      Value<double> subtotal,
    });

class $$ItemTransaksiTableTableFilterComposer
    extends Composer<_$AppDatabase, $ItemTransaksiTableTable> {
  $$ItemTransaksiTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemTransaksiTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemTransaksiTableTable> {
  $$ItemTransaksiTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemTransaksiTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemTransaksiTableTable> {
  $$ItemTransaksiTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<double> get hargaSatuan => $composableBuilder(
    column: $table.hargaSatuan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);
}

class $$ItemTransaksiTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemTransaksiTableTable,
          ItemTransaksiTableData,
          $$ItemTransaksiTableTableFilterComposer,
          $$ItemTransaksiTableTableOrderingComposer,
          $$ItemTransaksiTableTableAnnotationComposer,
          $$ItemTransaksiTableTableCreateCompanionBuilder,
          $$ItemTransaksiTableTableUpdateCompanionBuilder,
          (
            ItemTransaksiTableData,
            BaseReferences<
              _$AppDatabase,
              $ItemTransaksiTableTable,
              ItemTransaksiTableData
            >,
          ),
          ItemTransaksiTableData,
          PrefetchHooks Function()
        > {
  $$ItemTransaksiTableTableTableManager(
    _$AppDatabase db,
    $ItemTransaksiTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemTransaksiTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemTransaksiTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemTransaksiTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> transaksiId = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<double> hargaSatuan = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
              }) => ItemTransaksiTableCompanion(
                id: id,
                transaksiId: transaksiId,
                produkId: produkId,
                jumlah: jumlah,
                hargaSatuan: hargaSatuan,
                subtotal: subtotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int transaksiId,
                required int produkId,
                required int jumlah,
                required double hargaSatuan,
                required double subtotal,
              }) => ItemTransaksiTableCompanion.insert(
                id: id,
                transaksiId: transaksiId,
                produkId: produkId,
                jumlah: jumlah,
                hargaSatuan: hargaSatuan,
                subtotal: subtotal,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemTransaksiTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemTransaksiTableTable,
      ItemTransaksiTableData,
      $$ItemTransaksiTableTableFilterComposer,
      $$ItemTransaksiTableTableOrderingComposer,
      $$ItemTransaksiTableTableAnnotationComposer,
      $$ItemTransaksiTableTableCreateCompanionBuilder,
      $$ItemTransaksiTableTableUpdateCompanionBuilder,
      (
        ItemTransaksiTableData,
        BaseReferences<
          _$AppDatabase,
          $ItemTransaksiTableTable,
          ItemTransaksiTableData
        >,
      ),
      ItemTransaksiTableData,
      PrefetchHooks Function()
    >;
typedef $$HutangPiutangTableTableCreateCompanionBuilder =
    HutangPiutangTableCompanion Function({
      Value<int> id,
      Value<int?> transaksiId,
      required String namaPelanggan,
      required double jumlah,
      Value<String> status,
      Value<DateTime?> tanggalJatuhTempo,
      Value<DateTime> createdAt,
    });
typedef $$HutangPiutangTableTableUpdateCompanionBuilder =
    HutangPiutangTableCompanion Function({
      Value<int> id,
      Value<int?> transaksiId,
      Value<String> namaPelanggan,
      Value<double> jumlah,
      Value<String> status,
      Value<DateTime?> tanggalJatuhTempo,
      Value<DateTime> createdAt,
    });

class $$HutangPiutangTableTableFilterComposer
    extends Composer<_$AppDatabase, $HutangPiutangTableTable> {
  $$HutangPiutangTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get tanggalJatuhTempo => $composableBuilder(
    column: $table.tanggalJatuhTempo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HutangPiutangTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HutangPiutangTableTable> {
  $$HutangPiutangTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get tanggalJatuhTempo => $composableBuilder(
    column: $table.tanggalJatuhTempo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HutangPiutangTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HutangPiutangTableTable> {
  $$HutangPiutangTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get transaksiId => $composableBuilder(
    column: $table.transaksiId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get tanggalJatuhTempo => $composableBuilder(
    column: $table.tanggalJatuhTempo,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$HutangPiutangTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HutangPiutangTableTable,
          HutangPiutangTableData,
          $$HutangPiutangTableTableFilterComposer,
          $$HutangPiutangTableTableOrderingComposer,
          $$HutangPiutangTableTableAnnotationComposer,
          $$HutangPiutangTableTableCreateCompanionBuilder,
          $$HutangPiutangTableTableUpdateCompanionBuilder,
          (
            HutangPiutangTableData,
            BaseReferences<
              _$AppDatabase,
              $HutangPiutangTableTable,
              HutangPiutangTableData
            >,
          ),
          HutangPiutangTableData,
          PrefetchHooks Function()
        > {
  $$HutangPiutangTableTableTableManager(
    _$AppDatabase db,
    $HutangPiutangTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HutangPiutangTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HutangPiutangTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HutangPiutangTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> transaksiId = const Value.absent(),
                Value<String> namaPelanggan = const Value.absent(),
                Value<double> jumlah = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => HutangPiutangTableCompanion(
                id: id,
                transaksiId: transaksiId,
                namaPelanggan: namaPelanggan,
                jumlah: jumlah,
                status: status,
                tanggalJatuhTempo: tanggalJatuhTempo,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> transaksiId = const Value.absent(),
                required String namaPelanggan,
                required double jumlah,
                Value<String> status = const Value.absent(),
                Value<DateTime?> tanggalJatuhTempo = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => HutangPiutangTableCompanion.insert(
                id: id,
                transaksiId: transaksiId,
                namaPelanggan: namaPelanggan,
                jumlah: jumlah,
                status: status,
                tanggalJatuhTempo: tanggalJatuhTempo,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HutangPiutangTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HutangPiutangTableTable,
      HutangPiutangTableData,
      $$HutangPiutangTableTableFilterComposer,
      $$HutangPiutangTableTableOrderingComposer,
      $$HutangPiutangTableTableAnnotationComposer,
      $$HutangPiutangTableTableCreateCompanionBuilder,
      $$HutangPiutangTableTableUpdateCompanionBuilder,
      (
        HutangPiutangTableData,
        BaseReferences<
          _$AppDatabase,
          $HutangPiutangTableTable,
          HutangPiutangTableData
        >,
      ),
      HutangPiutangTableData,
      PrefetchHooks Function()
    >;
typedef $$RiwayatStokTableTableCreateCompanionBuilder =
    RiwayatStokTableCompanion Function({
      Value<int> id,
      required int produkId,
      required String tipe,
      required int jumlah,
      Value<String?> keterangan,
      Value<DateTime> createdAt,
    });
typedef $$RiwayatStokTableTableUpdateCompanionBuilder =
    RiwayatStokTableCompanion Function({
      Value<int> id,
      Value<int> produkId,
      Value<String> tipe,
      Value<int> jumlah,
      Value<String?> keterangan,
      Value<DateTime> createdAt,
    });

class $$RiwayatStokTableTableFilterComposer
    extends Composer<_$AppDatabase, $RiwayatStokTableTable> {
  $$RiwayatStokTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipe => $composableBuilder(
    column: $table.tipe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RiwayatStokTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RiwayatStokTableTable> {
  $$RiwayatStokTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipe => $composableBuilder(
    column: $table.tipe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RiwayatStokTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RiwayatStokTableTable> {
  $$RiwayatStokTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<String> get tipe =>
      $composableBuilder(column: $table.tipe, builder: (column) => column);

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<String> get keterangan => $composableBuilder(
    column: $table.keterangan,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RiwayatStokTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RiwayatStokTableTable,
          RiwayatStokTableData,
          $$RiwayatStokTableTableFilterComposer,
          $$RiwayatStokTableTableOrderingComposer,
          $$RiwayatStokTableTableAnnotationComposer,
          $$RiwayatStokTableTableCreateCompanionBuilder,
          $$RiwayatStokTableTableUpdateCompanionBuilder,
          (
            RiwayatStokTableData,
            BaseReferences<
              _$AppDatabase,
              $RiwayatStokTableTable,
              RiwayatStokTableData
            >,
          ),
          RiwayatStokTableData,
          PrefetchHooks Function()
        > {
  $$RiwayatStokTableTableTableManager(
    _$AppDatabase db,
    $RiwayatStokTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RiwayatStokTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RiwayatStokTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RiwayatStokTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<String> tipe = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<String?> keterangan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiwayatStokTableCompanion(
                id: id,
                produkId: produkId,
                tipe: tipe,
                jumlah: jumlah,
                keterangan: keterangan,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int produkId,
                required String tipe,
                required int jumlah,
                Value<String?> keterangan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RiwayatStokTableCompanion.insert(
                id: id,
                produkId: produkId,
                tipe: tipe,
                jumlah: jumlah,
                keterangan: keterangan,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RiwayatStokTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RiwayatStokTableTable,
      RiwayatStokTableData,
      $$RiwayatStokTableTableFilterComposer,
      $$RiwayatStokTableTableOrderingComposer,
      $$RiwayatStokTableTableAnnotationComposer,
      $$RiwayatStokTableTableCreateCompanionBuilder,
      $$RiwayatStokTableTableUpdateCompanionBuilder,
      (
        RiwayatStokTableData,
        BaseReferences<
          _$AppDatabase,
          $RiwayatStokTableTable,
          RiwayatStokTableData
        >,
      ),
      RiwayatStokTableData,
      PrefetchHooks Function()
    >;
typedef $$PembelianTableTableCreateCompanionBuilder =
    PembelianTableCompanion Function({
      Value<int> id,
      required String namaSupplier,
      required double totalHarga,
      Value<DateTime> createdAt,
    });
typedef $$PembelianTableTableUpdateCompanionBuilder =
    PembelianTableCompanion Function({
      Value<int> id,
      Value<String> namaSupplier,
      Value<double> totalHarga,
      Value<DateTime> createdAt,
    });

class $$PembelianTableTableFilterComposer
    extends Composer<_$AppDatabase, $PembelianTableTable> {
  $$PembelianTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PembelianTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PembelianTableTable> {
  $$PembelianTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PembelianTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PembelianTableTable> {
  $$PembelianTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => column,
  );

  GeneratedColumn<double> get totalHarga => $composableBuilder(
    column: $table.totalHarga,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PembelianTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PembelianTableTable,
          PembelianTableData,
          $$PembelianTableTableFilterComposer,
          $$PembelianTableTableOrderingComposer,
          $$PembelianTableTableAnnotationComposer,
          $$PembelianTableTableCreateCompanionBuilder,
          $$PembelianTableTableUpdateCompanionBuilder,
          (
            PembelianTableData,
            BaseReferences<
              _$AppDatabase,
              $PembelianTableTable,
              PembelianTableData
            >,
          ),
          PembelianTableData,
          PrefetchHooks Function()
        > {
  $$PembelianTableTableTableManager(
    _$AppDatabase db,
    $PembelianTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PembelianTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PembelianTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PembelianTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> namaSupplier = const Value.absent(),
                Value<double> totalHarga = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PembelianTableCompanion(
                id: id,
                namaSupplier: namaSupplier,
                totalHarga: totalHarga,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaSupplier,
                required double totalHarga,
                Value<DateTime> createdAt = const Value.absent(),
              }) => PembelianTableCompanion.insert(
                id: id,
                namaSupplier: namaSupplier,
                totalHarga: totalHarga,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PembelianTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PembelianTableTable,
      PembelianTableData,
      $$PembelianTableTableFilterComposer,
      $$PembelianTableTableOrderingComposer,
      $$PembelianTableTableAnnotationComposer,
      $$PembelianTableTableCreateCompanionBuilder,
      $$PembelianTableTableUpdateCompanionBuilder,
      (
        PembelianTableData,
        BaseReferences<_$AppDatabase, $PembelianTableTable, PembelianTableData>,
      ),
      PembelianTableData,
      PrefetchHooks Function()
    >;
typedef $$ItemPembelianTableTableCreateCompanionBuilder =
    ItemPembelianTableCompanion Function({
      Value<int> id,
      required int pembelianId,
      required int produkId,
      required int jumlah,
      required double hargaBeliSatuan,
      required double subtotal,
    });
typedef $$ItemPembelianTableTableUpdateCompanionBuilder =
    ItemPembelianTableCompanion Function({
      Value<int> id,
      Value<int> pembelianId,
      Value<int> produkId,
      Value<int> jumlah,
      Value<double> hargaBeliSatuan,
      Value<double> subtotal,
    });

class $$ItemPembelianTableTableFilterComposer
    extends Composer<_$AppDatabase, $ItemPembelianTableTable> {
  $$ItemPembelianTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pembelianId => $composableBuilder(
    column: $table.pembelianId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ItemPembelianTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemPembelianTableTable> {
  $$ItemPembelianTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pembelianId => $composableBuilder(
    column: $table.pembelianId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ItemPembelianTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemPembelianTableTable> {
  $$ItemPembelianTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pembelianId => $composableBuilder(
    column: $table.pembelianId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);
}

class $$ItemPembelianTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ItemPembelianTableTable,
          ItemPembelianTableData,
          $$ItemPembelianTableTableFilterComposer,
          $$ItemPembelianTableTableOrderingComposer,
          $$ItemPembelianTableTableAnnotationComposer,
          $$ItemPembelianTableTableCreateCompanionBuilder,
          $$ItemPembelianTableTableUpdateCompanionBuilder,
          (
            ItemPembelianTableData,
            BaseReferences<
              _$AppDatabase,
              $ItemPembelianTableTable,
              ItemPembelianTableData
            >,
          ),
          ItemPembelianTableData,
          PrefetchHooks Function()
        > {
  $$ItemPembelianTableTableTableManager(
    _$AppDatabase db,
    $ItemPembelianTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemPembelianTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemPembelianTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemPembelianTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pembelianId = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<double> hargaBeliSatuan = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
              }) => ItemPembelianTableCompanion(
                id: id,
                pembelianId: pembelianId,
                produkId: produkId,
                jumlah: jumlah,
                hargaBeliSatuan: hargaBeliSatuan,
                subtotal: subtotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pembelianId,
                required int produkId,
                required int jumlah,
                required double hargaBeliSatuan,
                required double subtotal,
              }) => ItemPembelianTableCompanion.insert(
                id: id,
                pembelianId: pembelianId,
                produkId: produkId,
                jumlah: jumlah,
                hargaBeliSatuan: hargaBeliSatuan,
                subtotal: subtotal,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ItemPembelianTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ItemPembelianTableTable,
      ItemPembelianTableData,
      $$ItemPembelianTableTableFilterComposer,
      $$ItemPembelianTableTableOrderingComposer,
      $$ItemPembelianTableTableAnnotationComposer,
      $$ItemPembelianTableTableCreateCompanionBuilder,
      $$ItemPembelianTableTableUpdateCompanionBuilder,
      (
        ItemPembelianTableData,
        BaseReferences<
          _$AppDatabase,
          $ItemPembelianTableTable,
          ItemPembelianTableData
        >,
      ),
      ItemPembelianTableData,
      PrefetchHooks Function()
    >;
typedef $$PendingOrderTableTableCreateCompanionBuilder =
    PendingOrderTableCompanion Function({
      Value<int> id,
      required String namaPelanggan,
      Value<String?> catatan,
      Value<DateTime> createdAt,
    });
typedef $$PendingOrderTableTableUpdateCompanionBuilder =
    PendingOrderTableCompanion Function({
      Value<int> id,
      Value<String> namaPelanggan,
      Value<String?> catatan,
      Value<DateTime> createdAt,
    });

class $$PendingOrderTableTableFilterComposer
    extends Composer<_$AppDatabase, $PendingOrderTableTable> {
  $$PendingOrderTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingOrderTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingOrderTableTable> {
  $$PendingOrderTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get catatan => $composableBuilder(
    column: $table.catatan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingOrderTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingOrderTableTable> {
  $$PendingOrderTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get namaPelanggan => $composableBuilder(
    column: $table.namaPelanggan,
    builder: (column) => column,
  );

  GeneratedColumn<String> get catatan =>
      $composableBuilder(column: $table.catatan, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$PendingOrderTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingOrderTableTable,
          PendingOrderTableData,
          $$PendingOrderTableTableFilterComposer,
          $$PendingOrderTableTableOrderingComposer,
          $$PendingOrderTableTableAnnotationComposer,
          $$PendingOrderTableTableCreateCompanionBuilder,
          $$PendingOrderTableTableUpdateCompanionBuilder,
          (
            PendingOrderTableData,
            BaseReferences<
              _$AppDatabase,
              $PendingOrderTableTable,
              PendingOrderTableData
            >,
          ),
          PendingOrderTableData,
          PrefetchHooks Function()
        > {
  $$PendingOrderTableTableTableManager(
    _$AppDatabase db,
    $PendingOrderTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingOrderTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingOrderTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingOrderTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> namaPelanggan = const Value.absent(),
                Value<String?> catatan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendingOrderTableCompanion(
                id: id,
                namaPelanggan: namaPelanggan,
                catatan: catatan,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String namaPelanggan,
                Value<String?> catatan = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => PendingOrderTableCompanion.insert(
                id: id,
                namaPelanggan: namaPelanggan,
                catatan: catatan,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingOrderTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingOrderTableTable,
      PendingOrderTableData,
      $$PendingOrderTableTableFilterComposer,
      $$PendingOrderTableTableOrderingComposer,
      $$PendingOrderTableTableAnnotationComposer,
      $$PendingOrderTableTableCreateCompanionBuilder,
      $$PendingOrderTableTableUpdateCompanionBuilder,
      (
        PendingOrderTableData,
        BaseReferences<
          _$AppDatabase,
          $PendingOrderTableTable,
          PendingOrderTableData
        >,
      ),
      PendingOrderTableData,
      PrefetchHooks Function()
    >;
typedef $$PendingOrderItemTableTableCreateCompanionBuilder =
    PendingOrderItemTableCompanion Function({
      Value<int> id,
      required int pendingOrderId,
      required int produkId,
      required String namaProduk,
      required double hargaJual,
      required int jumlah,
      Value<int> diskonTipe,
      Value<double> diskonValue,
      required double subtotal,
    });
typedef $$PendingOrderItemTableTableUpdateCompanionBuilder =
    PendingOrderItemTableCompanion Function({
      Value<int> id,
      Value<int> pendingOrderId,
      Value<int> produkId,
      Value<String> namaProduk,
      Value<double> hargaJual,
      Value<int> jumlah,
      Value<int> diskonTipe,
      Value<double> diskonValue,
      Value<double> subtotal,
    });

class $$PendingOrderItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $PendingOrderItemTableTable> {
  $$PendingOrderItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pendingOrderId => $composableBuilder(
    column: $table.pendingOrderId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingOrderItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingOrderItemTableTable> {
  $$PendingOrderItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingOrderId => $composableBuilder(
    column: $table.pendingOrderId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaJual => $composableBuilder(
    column: $table.hargaJual,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get subtotal => $composableBuilder(
    column: $table.subtotal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingOrderItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingOrderItemTableTable> {
  $$PendingOrderItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pendingOrderId => $composableBuilder(
    column: $table.pendingOrderId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => column,
  );

  GeneratedColumn<double> get hargaJual =>
      $composableBuilder(column: $table.hargaJual, builder: (column) => column);

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => column,
  );

  GeneratedColumn<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get subtotal =>
      $composableBuilder(column: $table.subtotal, builder: (column) => column);
}

class $$PendingOrderItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingOrderItemTableTable,
          PendingOrderItemTableData,
          $$PendingOrderItemTableTableFilterComposer,
          $$PendingOrderItemTableTableOrderingComposer,
          $$PendingOrderItemTableTableAnnotationComposer,
          $$PendingOrderItemTableTableCreateCompanionBuilder,
          $$PendingOrderItemTableTableUpdateCompanionBuilder,
          (
            PendingOrderItemTableData,
            BaseReferences<
              _$AppDatabase,
              $PendingOrderItemTableTable,
              PendingOrderItemTableData
            >,
          ),
          PendingOrderItemTableData,
          PrefetchHooks Function()
        > {
  $$PendingOrderItemTableTableTableManager(
    _$AppDatabase db,
    $PendingOrderItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingOrderItemTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PendingOrderItemTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingOrderItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pendingOrderId = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<String> namaProduk = const Value.absent(),
                Value<double> hargaJual = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<int> diskonTipe = const Value.absent(),
                Value<double> diskonValue = const Value.absent(),
                Value<double> subtotal = const Value.absent(),
              }) => PendingOrderItemTableCompanion(
                id: id,
                pendingOrderId: pendingOrderId,
                produkId: produkId,
                namaProduk: namaProduk,
                hargaJual: hargaJual,
                jumlah: jumlah,
                diskonTipe: diskonTipe,
                diskonValue: diskonValue,
                subtotal: subtotal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pendingOrderId,
                required int produkId,
                required String namaProduk,
                required double hargaJual,
                required int jumlah,
                Value<int> diskonTipe = const Value.absent(),
                Value<double> diskonValue = const Value.absent(),
                required double subtotal,
              }) => PendingOrderItemTableCompanion.insert(
                id: id,
                pendingOrderId: pendingOrderId,
                produkId: produkId,
                namaProduk: namaProduk,
                hargaJual: hargaJual,
                jumlah: jumlah,
                diskonTipe: diskonTipe,
                diskonValue: diskonValue,
                subtotal: subtotal,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingOrderItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingOrderItemTableTable,
      PendingOrderItemTableData,
      $$PendingOrderItemTableTableFilterComposer,
      $$PendingOrderItemTableTableOrderingComposer,
      $$PendingOrderItemTableTableAnnotationComposer,
      $$PendingOrderItemTableTableCreateCompanionBuilder,
      $$PendingOrderItemTableTableUpdateCompanionBuilder,
      (
        PendingOrderItemTableData,
        BaseReferences<
          _$AppDatabase,
          $PendingOrderItemTableTable,
          PendingOrderItemTableData
        >,
      ),
      PendingOrderItemTableData,
      PrefetchHooks Function()
    >;
typedef $$PendingPembelianTableTableCreateCompanionBuilder =
    PendingPembelianTableCompanion Function({
      Value<int> id,
      Value<int?> supplierId,
      Value<String?> namaSupplier,
      Value<DateTime> createdAt,
      Value<bool> isPpnEnabled,
      Value<double> ppnPercent,
    });
typedef $$PendingPembelianTableTableUpdateCompanionBuilder =
    PendingPembelianTableCompanion Function({
      Value<int> id,
      Value<int?> supplierId,
      Value<String?> namaSupplier,
      Value<DateTime> createdAt,
      Value<bool> isPpnEnabled,
      Value<double> ppnPercent,
    });

class $$PendingPembelianTableTableFilterComposer
    extends Composer<_$AppDatabase, $PendingPembelianTableTable> {
  $$PendingPembelianTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPpnEnabled => $composableBuilder(
    column: $table.isPpnEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get ppnPercent => $composableBuilder(
    column: $table.ppnPercent,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingPembelianTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingPembelianTableTable> {
  $$PendingPembelianTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPpnEnabled => $composableBuilder(
    column: $table.isPpnEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get ppnPercent => $composableBuilder(
    column: $table.ppnPercent,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingPembelianTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingPembelianTableTable> {
  $$PendingPembelianTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get supplierId => $composableBuilder(
    column: $table.supplierId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get namaSupplier => $composableBuilder(
    column: $table.namaSupplier,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isPpnEnabled => $composableBuilder(
    column: $table.isPpnEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<double> get ppnPercent => $composableBuilder(
    column: $table.ppnPercent,
    builder: (column) => column,
  );
}

class $$PendingPembelianTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingPembelianTableTable,
          PendingPembelianTableData,
          $$PendingPembelianTableTableFilterComposer,
          $$PendingPembelianTableTableOrderingComposer,
          $$PendingPembelianTableTableAnnotationComposer,
          $$PendingPembelianTableTableCreateCompanionBuilder,
          $$PendingPembelianTableTableUpdateCompanionBuilder,
          (
            PendingPembelianTableData,
            BaseReferences<
              _$AppDatabase,
              $PendingPembelianTableTable,
              PendingPembelianTableData
            >,
          ),
          PendingPembelianTableData,
          PrefetchHooks Function()
        > {
  $$PendingPembelianTableTableTableManager(
    _$AppDatabase db,
    $PendingPembelianTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingPembelianTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PendingPembelianTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingPembelianTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<String?> namaSupplier = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isPpnEnabled = const Value.absent(),
                Value<double> ppnPercent = const Value.absent(),
              }) => PendingPembelianTableCompanion(
                id: id,
                supplierId: supplierId,
                namaSupplier: namaSupplier,
                createdAt: createdAt,
                isPpnEnabled: isPpnEnabled,
                ppnPercent: ppnPercent,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> supplierId = const Value.absent(),
                Value<String?> namaSupplier = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<bool> isPpnEnabled = const Value.absent(),
                Value<double> ppnPercent = const Value.absent(),
              }) => PendingPembelianTableCompanion.insert(
                id: id,
                supplierId: supplierId,
                namaSupplier: namaSupplier,
                createdAt: createdAt,
                isPpnEnabled: isPpnEnabled,
                ppnPercent: ppnPercent,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingPembelianTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingPembelianTableTable,
      PendingPembelianTableData,
      $$PendingPembelianTableTableFilterComposer,
      $$PendingPembelianTableTableOrderingComposer,
      $$PendingPembelianTableTableAnnotationComposer,
      $$PendingPembelianTableTableCreateCompanionBuilder,
      $$PendingPembelianTableTableUpdateCompanionBuilder,
      (
        PendingPembelianTableData,
        BaseReferences<
          _$AppDatabase,
          $PendingPembelianTableTable,
          PendingPembelianTableData
        >,
      ),
      PendingPembelianTableData,
      PrefetchHooks Function()
    >;
typedef $$PendingPembelianItemTableTableCreateCompanionBuilder =
    PendingPembelianItemTableCompanion Function({
      Value<int> id,
      required int pendingPembelianId,
      required int produkId,
      required String namaProduk,
      required int jumlah,
      required double hargaBeliSatuan,
      required double hargaBeliLama,
      Value<int> diskonTipe,
      Value<double> diskonValue,
    });
typedef $$PendingPembelianItemTableTableUpdateCompanionBuilder =
    PendingPembelianItemTableCompanion Function({
      Value<int> id,
      Value<int> pendingPembelianId,
      Value<int> produkId,
      Value<String> namaProduk,
      Value<int> jumlah,
      Value<double> hargaBeliSatuan,
      Value<double> hargaBeliLama,
      Value<int> diskonTipe,
      Value<double> diskonValue,
    });

class $$PendingPembelianItemTableTableFilterComposer
    extends Composer<_$AppDatabase, $PendingPembelianItemTableTable> {
  $$PendingPembelianItemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pendingPembelianId => $composableBuilder(
    column: $table.pendingPembelianId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get hargaBeliLama => $composableBuilder(
    column: $table.hargaBeliLama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PendingPembelianItemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingPembelianItemTableTable> {
  $$PendingPembelianItemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pendingPembelianId => $composableBuilder(
    column: $table.pendingPembelianId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get produkId => $composableBuilder(
    column: $table.produkId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get jumlah => $composableBuilder(
    column: $table.jumlah,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get hargaBeliLama => $composableBuilder(
    column: $table.hargaBeliLama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PendingPembelianItemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingPembelianItemTableTable> {
  $$PendingPembelianItemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get pendingPembelianId => $composableBuilder(
    column: $table.pendingPembelianId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get produkId =>
      $composableBuilder(column: $table.produkId, builder: (column) => column);

  GeneratedColumn<String> get namaProduk => $composableBuilder(
    column: $table.namaProduk,
    builder: (column) => column,
  );

  GeneratedColumn<int> get jumlah =>
      $composableBuilder(column: $table.jumlah, builder: (column) => column);

  GeneratedColumn<double> get hargaBeliSatuan => $composableBuilder(
    column: $table.hargaBeliSatuan,
    builder: (column) => column,
  );

  GeneratedColumn<double> get hargaBeliLama => $composableBuilder(
    column: $table.hargaBeliLama,
    builder: (column) => column,
  );

  GeneratedColumn<int> get diskonTipe => $composableBuilder(
    column: $table.diskonTipe,
    builder: (column) => column,
  );

  GeneratedColumn<double> get diskonValue => $composableBuilder(
    column: $table.diskonValue,
    builder: (column) => column,
  );
}

class $$PendingPembelianItemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingPembelianItemTableTable,
          PendingPembelianItemTableData,
          $$PendingPembelianItemTableTableFilterComposer,
          $$PendingPembelianItemTableTableOrderingComposer,
          $$PendingPembelianItemTableTableAnnotationComposer,
          $$PendingPembelianItemTableTableCreateCompanionBuilder,
          $$PendingPembelianItemTableTableUpdateCompanionBuilder,
          (
            PendingPembelianItemTableData,
            BaseReferences<
              _$AppDatabase,
              $PendingPembelianItemTableTable,
              PendingPembelianItemTableData
            >,
          ),
          PendingPembelianItemTableData,
          PrefetchHooks Function()
        > {
  $$PendingPembelianItemTableTableTableManager(
    _$AppDatabase db,
    $PendingPembelianItemTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingPembelianItemTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PendingPembelianItemTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PendingPembelianItemTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> pendingPembelianId = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<String> namaProduk = const Value.absent(),
                Value<int> jumlah = const Value.absent(),
                Value<double> hargaBeliSatuan = const Value.absent(),
                Value<double> hargaBeliLama = const Value.absent(),
                Value<int> diskonTipe = const Value.absent(),
                Value<double> diskonValue = const Value.absent(),
              }) => PendingPembelianItemTableCompanion(
                id: id,
                pendingPembelianId: pendingPembelianId,
                produkId: produkId,
                namaProduk: namaProduk,
                jumlah: jumlah,
                hargaBeliSatuan: hargaBeliSatuan,
                hargaBeliLama: hargaBeliLama,
                diskonTipe: diskonTipe,
                diskonValue: diskonValue,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int pendingPembelianId,
                required int produkId,
                required String namaProduk,
                required int jumlah,
                required double hargaBeliSatuan,
                required double hargaBeliLama,
                Value<int> diskonTipe = const Value.absent(),
                Value<double> diskonValue = const Value.absent(),
              }) => PendingPembelianItemTableCompanion.insert(
                id: id,
                pendingPembelianId: pendingPembelianId,
                produkId: produkId,
                namaProduk: namaProduk,
                jumlah: jumlah,
                hargaBeliSatuan: hargaBeliSatuan,
                hargaBeliLama: hargaBeliLama,
                diskonTipe: diskonTipe,
                diskonValue: diskonValue,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PendingPembelianItemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingPembelianItemTableTable,
      PendingPembelianItemTableData,
      $$PendingPembelianItemTableTableFilterComposer,
      $$PendingPembelianItemTableTableOrderingComposer,
      $$PendingPembelianItemTableTableAnnotationComposer,
      $$PendingPembelianItemTableTableCreateCompanionBuilder,
      $$PendingPembelianItemTableTableUpdateCompanionBuilder,
      (
        PendingPembelianItemTableData,
        BaseReferences<
          _$AppDatabase,
          $PendingPembelianItemTableTable,
          PendingPembelianItemTableData
        >,
      ),
      PendingPembelianItemTableData,
      PrefetchHooks Function()
    >;
typedef $$SupplierTableTableCreateCompanionBuilder =
    SupplierTableCompanion Function({
      Value<int> id,
      required String nama,
      Value<String?> telepon,
      Value<String?> alamat,
      Value<DateTime> createdAt,
    });
typedef $$SupplierTableTableUpdateCompanionBuilder =
    SupplierTableCompanion Function({
      Value<int> id,
      Value<String> nama,
      Value<String?> telepon,
      Value<String?> alamat,
      Value<DateTime> createdAt,
    });

final class $$SupplierTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SupplierTableTable, SupplierTableData> {
  $$SupplierTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $SupplierProductsTableTable,
    List<SupplierProductsTableData>
  >
  _supplierProductsTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.supplierProductsTable,
        aliasName: $_aliasNameGenerator(
          db.supplierTable.id,
          db.supplierProductsTable.supplierId,
        ),
      );

  $$SupplierProductsTableTableProcessedTableManager
  get supplierProductsTableRefs {
    final manager = $$SupplierProductsTableTableTableManager(
      $_db,
      $_db.supplierProductsTable,
    ).filter((f) => f.supplierId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _supplierProductsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SupplierTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telepon => $composableBuilder(
    column: $table.telepon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> supplierProductsTableRefs(
    Expression<bool> Function($$SupplierProductsTableTableFilterComposer f) f,
  ) {
    final $$SupplierProductsTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierProductsTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierProductsTableTableFilterComposer(
                $db: $db,
                $table: $db.supplierProductsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SupplierTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telepon => $composableBuilder(
    column: $table.telepon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SupplierTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierTableTable> {
  $$SupplierTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get telepon =>
      $composableBuilder(column: $table.telepon, builder: (column) => column);

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> supplierProductsTableRefs<T extends Object>(
    Expression<T> Function($$SupplierProductsTableTableAnnotationComposer a) f,
  ) {
    final $$SupplierProductsTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.supplierProductsTable,
          getReferencedColumn: (t) => t.supplierId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SupplierProductsTableTableAnnotationComposer(
                $db: $db,
                $table: $db.supplierProductsTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SupplierTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierTableTable,
          SupplierTableData,
          $$SupplierTableTableFilterComposer,
          $$SupplierTableTableOrderingComposer,
          $$SupplierTableTableAnnotationComposer,
          $$SupplierTableTableCreateCompanionBuilder,
          $$SupplierTableTableUpdateCompanionBuilder,
          (SupplierTableData, $$SupplierTableTableReferences),
          SupplierTableData,
          PrefetchHooks Function({bool supplierProductsTableRefs})
        > {
  $$SupplierTableTableTableManager(_$AppDatabase db, $SupplierTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SupplierTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SupplierTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String?> telepon = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SupplierTableCompanion(
                id: id,
                nama: nama,
                telepon: telepon,
                alamat: alamat,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nama,
                Value<String?> telepon = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => SupplierTableCompanion.insert(
                id: id,
                nama: nama,
                telepon: telepon,
                alamat: alamat,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierProductsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (supplierProductsTableRefs) db.supplierProductsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (supplierProductsTableRefs)
                    await $_getPrefetchedData<
                      SupplierTableData,
                      $SupplierTableTable,
                      SupplierProductsTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SupplierTableTableReferences
                          ._supplierProductsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SupplierTableTableReferences(
                            db,
                            table,
                            p0,
                          ).supplierProductsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.supplierId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SupplierTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierTableTable,
      SupplierTableData,
      $$SupplierTableTableFilterComposer,
      $$SupplierTableTableOrderingComposer,
      $$SupplierTableTableAnnotationComposer,
      $$SupplierTableTableCreateCompanionBuilder,
      $$SupplierTableTableUpdateCompanionBuilder,
      (SupplierTableData, $$SupplierTableTableReferences),
      SupplierTableData,
      PrefetchHooks Function({bool supplierProductsTableRefs})
    >;
typedef $$NotifikasiTableTableCreateCompanionBuilder =
    NotifikasiTableCompanion Function({
      Value<int> id,
      required String judul,
      required String pesan,
      Value<String> tipe,
      Value<bool> isRead,
      Value<DateTime> createdAt,
    });
typedef $$NotifikasiTableTableUpdateCompanionBuilder =
    NotifikasiTableCompanion Function({
      Value<int> id,
      Value<String> judul,
      Value<String> pesan,
      Value<String> tipe,
      Value<bool> isRead,
      Value<DateTime> createdAt,
    });

class $$NotifikasiTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotifikasiTableTable> {
  $$NotifikasiTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get judul => $composableBuilder(
    column: $table.judul,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pesan => $composableBuilder(
    column: $table.pesan,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipe => $composableBuilder(
    column: $table.tipe,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotifikasiTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotifikasiTableTable> {
  $$NotifikasiTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get judul => $composableBuilder(
    column: $table.judul,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pesan => $composableBuilder(
    column: $table.pesan,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipe => $composableBuilder(
    column: $table.tipe,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotifikasiTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotifikasiTableTable> {
  $$NotifikasiTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get judul =>
      $composableBuilder(column: $table.judul, builder: (column) => column);

  GeneratedColumn<String> get pesan =>
      $composableBuilder(column: $table.pesan, builder: (column) => column);

  GeneratedColumn<String> get tipe =>
      $composableBuilder(column: $table.tipe, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NotifikasiTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotifikasiTableTable,
          NotifikasiTableData,
          $$NotifikasiTableTableFilterComposer,
          $$NotifikasiTableTableOrderingComposer,
          $$NotifikasiTableTableAnnotationComposer,
          $$NotifikasiTableTableCreateCompanionBuilder,
          $$NotifikasiTableTableUpdateCompanionBuilder,
          (
            NotifikasiTableData,
            BaseReferences<
              _$AppDatabase,
              $NotifikasiTableTable,
              NotifikasiTableData
            >,
          ),
          NotifikasiTableData,
          PrefetchHooks Function()
        > {
  $$NotifikasiTableTableTableManager(
    _$AppDatabase db,
    $NotifikasiTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotifikasiTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotifikasiTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotifikasiTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> judul = const Value.absent(),
                Value<String> pesan = const Value.absent(),
                Value<String> tipe = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => NotifikasiTableCompanion(
                id: id,
                judul: judul,
                pesan: pesan,
                tipe: tipe,
                isRead: isRead,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String judul,
                required String pesan,
                Value<String> tipe = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => NotifikasiTableCompanion.insert(
                id: id,
                judul: judul,
                pesan: pesan,
                tipe: tipe,
                isRead: isRead,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotifikasiTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotifikasiTableTable,
      NotifikasiTableData,
      $$NotifikasiTableTableFilterComposer,
      $$NotifikasiTableTableOrderingComposer,
      $$NotifikasiTableTableAnnotationComposer,
      $$NotifikasiTableTableCreateCompanionBuilder,
      $$NotifikasiTableTableUpdateCompanionBuilder,
      (
        NotifikasiTableData,
        BaseReferences<
          _$AppDatabase,
          $NotifikasiTableTable,
          NotifikasiTableData
        >,
      ),
      NotifikasiTableData,
      PrefetchHooks Function()
    >;
typedef $$TokoTableTableCreateCompanionBuilder =
    TokoTableCompanion Function({
      Value<int> id,
      required String nama,
      Value<String?> alamat,
      Value<String?> telepon,
      Value<DateTime> createdAt,
    });
typedef $$TokoTableTableUpdateCompanionBuilder =
    TokoTableCompanion Function({
      Value<int> id,
      Value<String> nama,
      Value<String?> alamat,
      Value<String?> telepon,
      Value<DateTime> createdAt,
    });

class $$TokoTableTableFilterComposer
    extends Composer<_$AppDatabase, $TokoTableTable> {
  $$TokoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telepon => $composableBuilder(
    column: $table.telepon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TokoTableTableOrderingComposer
    extends Composer<_$AppDatabase, $TokoTableTable> {
  $$TokoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alamat => $composableBuilder(
    column: $table.alamat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telepon => $composableBuilder(
    column: $table.telepon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TokoTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TokoTableTable> {
  $$TokoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get alamat =>
      $composableBuilder(column: $table.alamat, builder: (column) => column);

  GeneratedColumn<String> get telepon =>
      $composableBuilder(column: $table.telepon, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TokoTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TokoTableTable,
          TokoTableData,
          $$TokoTableTableFilterComposer,
          $$TokoTableTableOrderingComposer,
          $$TokoTableTableAnnotationComposer,
          $$TokoTableTableCreateCompanionBuilder,
          $$TokoTableTableUpdateCompanionBuilder,
          (
            TokoTableData,
            BaseReferences<_$AppDatabase, $TokoTableTable, TokoTableData>,
          ),
          TokoTableData,
          PrefetchHooks Function()
        > {
  $$TokoTableTableTableManager(_$AppDatabase db, $TokoTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TokoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TokoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TokoTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String?> alamat = const Value.absent(),
                Value<String?> telepon = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TokoTableCompanion(
                id: id,
                nama: nama,
                alamat: alamat,
                telepon: telepon,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nama,
                Value<String?> alamat = const Value.absent(),
                Value<String?> telepon = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => TokoTableCompanion.insert(
                id: id,
                nama: nama,
                alamat: alamat,
                telepon: telepon,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TokoTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TokoTableTable,
      TokoTableData,
      $$TokoTableTableFilterComposer,
      $$TokoTableTableOrderingComposer,
      $$TokoTableTableAnnotationComposer,
      $$TokoTableTableCreateCompanionBuilder,
      $$TokoTableTableUpdateCompanionBuilder,
      (
        TokoTableData,
        BaseReferences<_$AppDatabase, $TokoTableTable, TokoTableData>,
      ),
      TokoTableData,
      PrefetchHooks Function()
    >;
typedef $$UserTableTableCreateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String?> username,
      required String password,
      required String role,
      Value<String?> nama,
      Value<String?> email,
      Value<int> tokoId,
      Value<DateTime> createdAt,
    });
typedef $$UserTableTableUpdateCompanionBuilder =
    UserTableCompanion Function({
      Value<int> id,
      Value<String?> username,
      Value<String> password,
      Value<String> role,
      Value<String?> nama,
      Value<String?> email,
      Value<int> tokoId,
      Value<DateTime> createdAt,
    });

class $$UserTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tokoId => $composableBuilder(
    column: $table.tokoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get username => $composableBuilder(
    column: $table.username,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tokoId => $composableBuilder(
    column: $table.tokoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get tokoId =>
      $composableBuilder(column: $table.tokoId, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$UserTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserTableTable,
          UserTableData,
          $$UserTableTableFilterComposer,
          $$UserTableTableOrderingComposer,
          $$UserTableTableAnnotationComposer,
          $$UserTableTableCreateCompanionBuilder,
          $$UserTableTableUpdateCompanionBuilder,
          (
            UserTableData,
            BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>,
          ),
          UserTableData,
          PrefetchHooks Function()
        > {
  $$UserTableTableTableManager(_$AppDatabase db, $UserTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> username = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String?> nama = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int> tokoId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserTableCompanion(
                id: id,
                username: username,
                password: password,
                role: role,
                nama: nama,
                email: email,
                tokoId: tokoId,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String?> username = const Value.absent(),
                required String password,
                required String role,
                Value<String?> nama = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int> tokoId = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UserTableCompanion.insert(
                id: id,
                username: username,
                password: password,
                role: role,
                nama: nama,
                email: email,
                tokoId: tokoId,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserTableTable,
      UserTableData,
      $$UserTableTableFilterComposer,
      $$UserTableTableOrderingComposer,
      $$UserTableTableAnnotationComposer,
      $$UserTableTableCreateCompanionBuilder,
      $$UserTableTableUpdateCompanionBuilder,
      (
        UserTableData,
        BaseReferences<_$AppDatabase, $UserTableTable, UserTableData>,
      ),
      UserTableData,
      PrefetchHooks Function()
    >;
typedef $$SyncRecordTableTableCreateCompanionBuilder =
    SyncRecordTableCompanion Function({
      required String uuid,
      required String tableEntity,
      required int localId,
      required int updatedAt,
      Value<bool> isDeleted,
      Value<String> syncStatus,
      Value<int> tokoId,
      Value<int> rowid,
    });
typedef $$SyncRecordTableTableUpdateCompanionBuilder =
    SyncRecordTableCompanion Function({
      Value<String> uuid,
      Value<String> tableEntity,
      Value<int> localId,
      Value<int> updatedAt,
      Value<bool> isDeleted,
      Value<String> syncStatus,
      Value<int> tokoId,
      Value<int> rowid,
    });

class $$SyncRecordTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncRecordTableTable> {
  $$SyncRecordTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tableEntity => $composableBuilder(
    column: $table.tableEntity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tokoId => $composableBuilder(
    column: $table.tokoId,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SyncRecordTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncRecordTableTable> {
  $$SyncRecordTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tableEntity => $composableBuilder(
    column: $table.tableEntity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get localId => $composableBuilder(
    column: $table.localId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tokoId => $composableBuilder(
    column: $table.tokoId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SyncRecordTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncRecordTableTable> {
  $$SyncRecordTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get tableEntity => $composableBuilder(
    column: $table.tableEntity,
    builder: (column) => column,
  );

  GeneratedColumn<int> get localId =>
      $composableBuilder(column: $table.localId, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
    column: $table.syncStatus,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tokoId =>
      $composableBuilder(column: $table.tokoId, builder: (column) => column);
}

class $$SyncRecordTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SyncRecordTableTable,
          SyncRecordTableData,
          $$SyncRecordTableTableFilterComposer,
          $$SyncRecordTableTableOrderingComposer,
          $$SyncRecordTableTableAnnotationComposer,
          $$SyncRecordTableTableCreateCompanionBuilder,
          $$SyncRecordTableTableUpdateCompanionBuilder,
          (
            SyncRecordTableData,
            BaseReferences<
              _$AppDatabase,
              $SyncRecordTableTable,
              SyncRecordTableData
            >,
          ),
          SyncRecordTableData,
          PrefetchHooks Function()
        > {
  $$SyncRecordTableTableTableManager(
    _$AppDatabase db,
    $SyncRecordTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncRecordTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncRecordTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncRecordTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> tableEntity = const Value.absent(),
                Value<int> localId = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> tokoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncRecordTableCompanion(
                uuid: uuid,
                tableEntity: tableEntity,
                localId: localId,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                syncStatus: syncStatus,
                tokoId: tokoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String tableEntity,
                required int localId,
                required int updatedAt,
                Value<bool> isDeleted = const Value.absent(),
                Value<String> syncStatus = const Value.absent(),
                Value<int> tokoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SyncRecordTableCompanion.insert(
                uuid: uuid,
                tableEntity: tableEntity,
                localId: localId,
                updatedAt: updatedAt,
                isDeleted: isDeleted,
                syncStatus: syncStatus,
                tokoId: tokoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SyncRecordTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SyncRecordTableTable,
      SyncRecordTableData,
      $$SyncRecordTableTableFilterComposer,
      $$SyncRecordTableTableOrderingComposer,
      $$SyncRecordTableTableAnnotationComposer,
      $$SyncRecordTableTableCreateCompanionBuilder,
      $$SyncRecordTableTableUpdateCompanionBuilder,
      (
        SyncRecordTableData,
        BaseReferences<
          _$AppDatabase,
          $SyncRecordTableTable,
          SyncRecordTableData
        >,
      ),
      SyncRecordTableData,
      PrefetchHooks Function()
    >;
typedef $$SupplierProductsTableTableCreateCompanionBuilder =
    SupplierProductsTableCompanion Function({
      Value<int> id,
      required int supplierId,
      required int produkId,
      required double lastPrice,
      required DateTime updatedAt,
    });
typedef $$SupplierProductsTableTableUpdateCompanionBuilder =
    SupplierProductsTableCompanion Function({
      Value<int> id,
      Value<int> supplierId,
      Value<int> produkId,
      Value<double> lastPrice,
      Value<DateTime> updatedAt,
    });

final class $$SupplierProductsTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SupplierProductsTableTable,
          SupplierProductsTableData
        > {
  $$SupplierProductsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SupplierTableTable _supplierIdTable(_$AppDatabase db) =>
      db.supplierTable.createAlias(
        $_aliasNameGenerator(
          db.supplierProductsTable.supplierId,
          db.supplierTable.id,
        ),
      );

  $$SupplierTableTableProcessedTableManager get supplierId {
    final $_column = $_itemColumn<int>('supplier_id')!;

    final manager = $$SupplierTableTableTableManager(
      $_db,
      $_db.supplierTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProdukTableTable _produkIdTable(_$AppDatabase db) =>
      db.produkTable.createAlias(
        $_aliasNameGenerator(
          db.supplierProductsTable.produkId,
          db.produkTable.id,
        ),
      );

  $$ProdukTableTableProcessedTableManager get produkId {
    final $_column = $_itemColumn<int>('produk_id')!;

    final manager = $$ProdukTableTableTableManager(
      $_db,
      $_db.produkTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_produkIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SupplierProductsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SupplierProductsTableTable> {
  $$SupplierProductsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lastPrice => $composableBuilder(
    column: $table.lastPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$SupplierTableTableFilterComposer get supplierId {
    final $$SupplierTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplierTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableTableFilterComposer(
            $db: $db,
            $table: $db.supplierTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdukTableTableFilterComposer get produkId {
    final $$ProdukTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produkId,
      referencedTable: $db.produkTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdukTableTableFilterComposer(
            $db: $db,
            $table: $db.produkTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierProductsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SupplierProductsTableTable> {
  $$SupplierProductsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lastPrice => $composableBuilder(
    column: $table.lastPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$SupplierTableTableOrderingComposer get supplierId {
    final $$SupplierTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplierTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableTableOrderingComposer(
            $db: $db,
            $table: $db.supplierTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdukTableTableOrderingComposer get produkId {
    final $$ProdukTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produkId,
      referencedTable: $db.produkTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdukTableTableOrderingComposer(
            $db: $db,
            $table: $db.produkTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierProductsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SupplierProductsTableTable> {
  $$SupplierProductsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get lastPrice =>
      $composableBuilder(column: $table.lastPrice, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$SupplierTableTableAnnotationComposer get supplierId {
    final $$SupplierTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.supplierId,
      referencedTable: $db.supplierTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SupplierTableTableAnnotationComposer(
            $db: $db,
            $table: $db.supplierTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProdukTableTableAnnotationComposer get produkId {
    final $$ProdukTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.produkId,
      referencedTable: $db.produkTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProdukTableTableAnnotationComposer(
            $db: $db,
            $table: $db.produkTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SupplierProductsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SupplierProductsTableTable,
          SupplierProductsTableData,
          $$SupplierProductsTableTableFilterComposer,
          $$SupplierProductsTableTableOrderingComposer,
          $$SupplierProductsTableTableAnnotationComposer,
          $$SupplierProductsTableTableCreateCompanionBuilder,
          $$SupplierProductsTableTableUpdateCompanionBuilder,
          (SupplierProductsTableData, $$SupplierProductsTableTableReferences),
          SupplierProductsTableData,
          PrefetchHooks Function({bool supplierId, bool produkId})
        > {
  $$SupplierProductsTableTableTableManager(
    _$AppDatabase db,
    $SupplierProductsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SupplierProductsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$SupplierProductsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$SupplierProductsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> supplierId = const Value.absent(),
                Value<int> produkId = const Value.absent(),
                Value<double> lastPrice = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => SupplierProductsTableCompanion(
                id: id,
                supplierId: supplierId,
                produkId: produkId,
                lastPrice: lastPrice,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int supplierId,
                required int produkId,
                required double lastPrice,
                required DateTime updatedAt,
              }) => SupplierProductsTableCompanion.insert(
                id: id,
                supplierId: supplierId,
                produkId: produkId,
                lastPrice: lastPrice,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SupplierProductsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({supplierId = false, produkId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (supplierId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.supplierId,
                                referencedTable:
                                    $$SupplierProductsTableTableReferences
                                        ._supplierIdTable(db),
                                referencedColumn:
                                    $$SupplierProductsTableTableReferences
                                        ._supplierIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (produkId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.produkId,
                                referencedTable:
                                    $$SupplierProductsTableTableReferences
                                        ._produkIdTable(db),
                                referencedColumn:
                                    $$SupplierProductsTableTableReferences
                                        ._produkIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SupplierProductsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SupplierProductsTableTable,
      SupplierProductsTableData,
      $$SupplierProductsTableTableFilterComposer,
      $$SupplierProductsTableTableOrderingComposer,
      $$SupplierProductsTableTableAnnotationComposer,
      $$SupplierProductsTableTableCreateCompanionBuilder,
      $$SupplierProductsTableTableUpdateCompanionBuilder,
      (SupplierProductsTableData, $$SupplierProductsTableTableReferences),
      SupplierProductsTableData,
      PrefetchHooks Function({bool supplierId, bool produkId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProdukTableTableTableManager get produkTable =>
      $$ProdukTableTableTableManager(_db, _db.produkTable);
  $$SatuanProdukTableTableTableManager get satuanProdukTable =>
      $$SatuanProdukTableTableTableManager(_db, _db.satuanProdukTable);
  $$TransaksiTableTableTableManager get transaksiTable =>
      $$TransaksiTableTableTableManager(_db, _db.transaksiTable);
  $$ItemTransaksiTableTableTableManager get itemTransaksiTable =>
      $$ItemTransaksiTableTableTableManager(_db, _db.itemTransaksiTable);
  $$HutangPiutangTableTableTableManager get hutangPiutangTable =>
      $$HutangPiutangTableTableTableManager(_db, _db.hutangPiutangTable);
  $$RiwayatStokTableTableTableManager get riwayatStokTable =>
      $$RiwayatStokTableTableTableManager(_db, _db.riwayatStokTable);
  $$PembelianTableTableTableManager get pembelianTable =>
      $$PembelianTableTableTableManager(_db, _db.pembelianTable);
  $$ItemPembelianTableTableTableManager get itemPembelianTable =>
      $$ItemPembelianTableTableTableManager(_db, _db.itemPembelianTable);
  $$PendingOrderTableTableTableManager get pendingOrderTable =>
      $$PendingOrderTableTableTableManager(_db, _db.pendingOrderTable);
  $$PendingOrderItemTableTableTableManager get pendingOrderItemTable =>
      $$PendingOrderItemTableTableTableManager(_db, _db.pendingOrderItemTable);
  $$PendingPembelianTableTableTableManager get pendingPembelianTable =>
      $$PendingPembelianTableTableTableManager(_db, _db.pendingPembelianTable);
  $$PendingPembelianItemTableTableTableManager get pendingPembelianItemTable =>
      $$PendingPembelianItemTableTableTableManager(
        _db,
        _db.pendingPembelianItemTable,
      );
  $$SupplierTableTableTableManager get supplierTable =>
      $$SupplierTableTableTableManager(_db, _db.supplierTable);
  $$NotifikasiTableTableTableManager get notifikasiTable =>
      $$NotifikasiTableTableTableManager(_db, _db.notifikasiTable);
  $$TokoTableTableTableManager get tokoTable =>
      $$TokoTableTableTableManager(_db, _db.tokoTable);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$SyncRecordTableTableTableManager get syncRecordTable =>
      $$SyncRecordTableTableTableManager(_db, _db.syncRecordTable);
  $$SupplierProductsTableTableTableManager get supplierProductsTable =>
      $$SupplierProductsTableTableTableManager(_db, _db.supplierProductsTable);
}
