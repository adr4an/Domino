import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/features/history/presentation/widgets/history_item.dart';
import 'package:domino/features/history/presentation/widgets/history_status_chip.dart';
import 'package:flutter/material.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/order_history_text.dart';
import 'package:domino/utils/helpers/pricing_calculator.dart';

class WHistoryCard extends StatelessWidget {
  const WHistoryCard({
    super.key,
    required this.items,
    required this.status,
    required this.purchaseDate,
  });

  final List<Map<String, Object>> items;
  final OrderStatus status;
  final String purchaseDate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final total = TPricingCalculator.calculateItemsTotal(items);
    final itemCount = items.fold<int>(
      0,
      (sum, item) => sum + (item['quantity'] as int),
    );

    return Container(
      padding: const EdgeInsets.all(TSizes.md),
      decoration: BoxDecoration(
        color: TColors.grey50,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        border: Border.all(color: TColors.borderSecondary),
        boxShadow: TShadowStyle.subtleShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (Icon + Date + Item Count + Status)
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: TColors.textOrange.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
                ),
                child: const Icon(
                  Icons.receipt_long_outlined,
                  size: TSizes.iconSm,
                  color: TColors.textOrange,
                ),
              ),
              const SizedBox(width: TSizes.md - 4),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      purchaseDate,
                      style: theme.bodyMedium?.copyWith(
                        color: TColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      OrderHistoryTexts.itemCount(itemCount),
                      style: theme.labelSmall?.copyWith(
                        color: TColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),

              WHistoryStatusChip(status: status),
            ],
          ),
          const SizedBox(height: TSizes.md),
          const Divider(height: 1, color: TColors.borderSecondary),
          const SizedBox(height: TSizes.md),

          // Product Details
          for (var index = 0; index < items.length; index++) ...[
            WHistoryItem(item: items[index]),
            if (index < items.length - 1) const SizedBox(height: 12),
          ],
          const SizedBox(height: TSizes.md),

          // Order Total
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md - 4,
              vertical: TSizes.sm + 2,
            ),
            decoration: BoxDecoration(
              color: TColors.grey200,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusSm),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  OrderHistoryTexts.orderTotal,
                  style: theme.bodySmall?.copyWith(
                    color: TColors.darkerGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${OrderHistoryTexts.currencySymbol}${total.toStringAsFixed(2)}',
                  style: theme.titleSmall?.copyWith(
                    color: TColors.textOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
