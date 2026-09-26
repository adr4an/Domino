import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WHistoryItem extends StatelessWidget {
  const WHistoryItem({super.key, required this.item, required this.status});

  final Map<String, Object> item;
  final OrderStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      height: 56,
      child: Row(
        children: [
          WRoundedContainer(
            width: 55,
            height: 55,
            radius: TSizes.md,
            backgroundColor: TColors.grey300,
            child: WDisplayImage(
              imagePath:
                  item['imageUrl'] as String? ?? TImageString.pizzaProdcut1,
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['name'] as String,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.titleSmall,
                ),
                Text(
                  '₱${item['price']}',
                  style: theme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: TSizes.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quantity: ${item['quantity']}', style: theme.labelMedium),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: status.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status.label,
                  style: theme.labelSmall!.copyWith(color: status.color),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
