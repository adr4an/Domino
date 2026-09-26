import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/features/history/presentation/widgets/history_item.dart';
import 'package:flutter/material.dart';
import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';

class WHistoryCard extends StatelessWidget {
  const WHistoryCard({super.key, required this.items, required this.status});

  final List<Map<String, Object>> items;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.sm,
        vertical: TSizes.sm,
      ),
      decoration: BoxDecoration(
        color: TColors.grey100,
        borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        boxShadow: TShadowStyle.subtleShadow,
      ),
      child: Column(
        children: [
          for (var index = 0; index < items.length; index++) ...[
            WHistoryItem(item: items[index], status: status),
            if (index < items.length - 1) const Divider(height: TSizes.md),
          ],
        ],
      ),
    );
  }
}
