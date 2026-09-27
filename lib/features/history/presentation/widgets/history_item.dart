import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/order_history_text.dart';
import 'package:domino/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class WHistoryItem extends StatelessWidget {
  const WHistoryItem({super.key, required this.item});

  final Map<String, Object> item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final unitPrice = item['price'].toString();
    final quantity = item['quantity'] as int;
    final lineTotal = TPricingCalculator.calculateItemTotal(
      sizePrice: double.parse(unitPrice),
      toppingPrices: const [],
      quantity: quantity,
    );

    return Row(
      children: [
        // Product Image
        WRoundedContainer(
          width: 52,
          height: 52,
          radius: TSizes.cardRadiusMd,
          backgroundColor: TColors.grey200,
          child: WDisplayImage(
            imagePath:
                item['imageUrl'] as String? ?? TImageString.pizzaProdcut1,
          ),
        ),
        const SizedBox(width: TSizes.md - 4),

        // Name + Unit Price x Quantity
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'] as String,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.bodyMedium?.copyWith(
                  color: TColors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                OrderHistoryTexts.unitPriceLabel(unitPrice, quantity),
                style: theme.labelSmall?.copyWith(color: TColors.darkGrey),
              ),
            ],
          ),
        ),
        const SizedBox(width: TSizes.sm),

        // Line Total
        Text(
          '${OrderHistoryTexts.currencySymbol}${lineTotal.toStringAsFixed(2)}',
          style: theme.titleSmall?.copyWith(
            color: TColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
