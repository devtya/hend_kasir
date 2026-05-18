import 'package:equatable/equatable.dart';

class PendingPembelian extends Equatable {
  final int? id;
  final int? supplierId;
  final String? namaSupplier;
  final DateTime? createdAt;
  final bool isPpnEnabled;
  final double ppnPercent;

  const PendingPembelian({
    this.id,
    this.supplierId,
    this.namaSupplier,
    this.createdAt,
    this.isPpnEnabled = false,
    this.ppnPercent = 11.0,
  });

  @override
  List<Object?> get props => [
    id,
    supplierId,
    namaSupplier,
    createdAt,
    isPpnEnabled,
    ppnPercent,
  ];
}
