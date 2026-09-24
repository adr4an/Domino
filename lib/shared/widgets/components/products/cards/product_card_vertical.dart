import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/components/texts/custom_badge.dart';
import 'package:domino/shared/widgets/components/texts/product_price_text.dart';
import 'package:domino/shared/widgets/components/texts/product_title_text.dart';
import 'package:domino/shared/widgets/images/rounded_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WProductCardVertical extends StatelessWidget {
  const WProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.calories,
    required this.productName,
    required this.deliveryTime,
    required this.description,
    required this.price,
  });

  final String imageUrl;
  final String calories;
  final String productName;
  final String deliveryTime;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: TShadowStyle.subtleShadow,
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: TColors.grey100,
      ), // BoxDecoration
      child: Column(
        children: [
          // Thumbnail
          WRoundedContainer(
            height: 160,
            backgroundColor: TColors.grey300,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Product Image
                Positioned.fill(
                  top: 12,
                  child: WRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                  ),
                ),

                // Calories
                Positioned(
                  top: 12,
                  left: 0,
                  child: WCustomBadge(
                    roundLeft: false,
                    iconPath: TIconString.fire,
                    label: calories,
                    iconSize: 16,
                  ),
                ),

                // Delivery Time Badge
                Positioned(
                  top: 12,
                  right: 0,
                  child: WCustomBadge(
                    roundRight: false,
                    iconPath: TIconString.clock,
                    label: deliveryTime,
                    iconSize: 15,
                  ),
                ),
              ],
            ), // Stack
          ), // TRoundedContainer
          SizedBox(height: TSizes.spaceBtwItems / 2),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: productName, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  Text(
                    description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: theme.labelSmall,
                  ),
                  const Spacer(),

                  // Price + Detail Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      WProductPriceText(price: price),

                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ), // BorderRadius.only
                        ), // BoxDecoration
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ), // SizedBox
                      ), // Container
                    ],
                  ),
                ],
              ), // Column
            ),
          ),
        ],
      ),
    );
  }
}
