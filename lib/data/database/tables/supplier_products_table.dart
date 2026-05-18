import 'package:drift/drift.dart';

import 'produk_table.dart';
import 'supplier_table.dart';

class SupplierProductsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplierId => integer().references(SupplierTable, #id)();
  IntColumn get produkId => integer().references(ProdukTable, #id)();
  RealColumn get lastPrice => real()();
  DateTimeColumn get updatedAt => dateTime()();
}
