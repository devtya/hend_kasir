import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_theme.dart';
import '../../domain/entities/produk.dart';

class ProdukCard extends StatelessWidget {
  final Produk produk;
  final VoidCallback? onTap;
  final VoidCallback? onStockTap;
  final VoidCallback? onDelete;
  final VoidCallback? onLogTap;

  const ProdukCard({
    super.key,
    required this.produk,
    this.onTap,
    this.onStockTap,
    this.onDelete,
    this.onLogTap,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    final isLowStock = produk.stok <= 5;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      produk.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Modal: ${currency.format(produk.hargaBeli)}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.neutralGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      currency.format(produk.hargaJual),
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.qr_code,
                    size: 20,
                    color: produk.barcode != null
                        ? AppTheme.primaryGreen
                        : AppTheme.neutralGrey.withValues(alpha: 0.3),
                  ),
                  const SizedBox(width: 4),
                  if (onStockTap != null)
                    IconButton(
                      icon: const Icon(Icons.inventory_2_outlined, size: 20),
                      color: AppTheme.primaryGreen,
                      onPressed: onStockTap,
                    ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isLowStock
                              ? AppTheme.warningOrange.withValues(alpha: 0.15)
                              : AppTheme.lightGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Stok: ${produk.stok}',
                          style: TextStyle(
                            color: isLowStock
                                ? AppTheme.warningOrange
                                : AppTheme.primaryGreen,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      if (produk.satuan != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Text(
                            '/ ${produk.satuan}',
                            style: TextStyle(
                              fontSize: 11,
                              color: AppTheme.neutralGrey,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (onLogTap != null)
                    IconButton(
                      icon: const Icon(Icons.info_outline, size: 20),
                      color: AppTheme.neutralGrey,
                      onPressed: onLogTap,
                    ),
                ],
              ),
              if (onDelete != null) ...[
                const SizedBox(width: 4),
                IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  color: AppTheme.warningRed,
                  onPressed: onDelete,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
