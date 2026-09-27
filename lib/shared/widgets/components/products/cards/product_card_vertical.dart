import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/shared/widgets/components/texts/product_price_text.dart';
import 'package:domino/shared/widgets/components/texts/product_title_text.dart';
import 'package:domino/shared/widgets/effects/glass_decoration.dart';
import 'package:domino/shared/widgets/icons/circular_icon.dart';
import 'package:domino/shared/widgets/images/rounded_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/gradients.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WProductCardVertical extends StatelessWidget {
  const WProductCardVertical({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    this.calories,
    this.deliveryTime,
    this.description,
    this.topLeftBadge,
    this.topRightBadge,
    this.rightBadgeTopPosition = 12,
    this.rightBadgeRightPosition = 0,
    this.onPressed,
  });

  final String imageUrl;
  final String price;
  final String productName;
  final String? calories;
  final String? deliveryTime;
  final String? description;
  final Widget? topLeftBadge;
  final Widget? topRightBadge;
  final double? rightBadgeTopPosition;
  final double? rightBadgeRightPosition;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final radius = BorderRadius.circular(TSizes.productImageRadius);

    final card = Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: TShadowStyle.subtleShadow,
        borderRadius: radius,
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
                  top: 5,
                  child: WRoundedImage(
                    imageUrl: imageUrl,
                    applyImageRadius: true,
                  ),
                ),

                // Top LEft Badge
                if (topLeftBadge != null)
                  Positioned(top: 12, left: 0, child: topLeftBadge!),

                // Right LEft Badge
                if (topRightBadge != null)
                  Positioned(
                    top: rightBadgeTopPosition,
                    right: rightBadgeRightPosition,
                    child: topRightBadge!,
                  ),
              ],
            ), // Stack
          ), // TRoundedContainer
          SizedBox(height: TSizes.spaceBtwItems / 2),

          // Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: TSizes.sm,
                right: TSizes.xs,
                bottom: TSizes.xs,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: productName, smallSize: true),

                  if (description != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems / 2),
                        Text(
                          description!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: theme.labelSmall,
                        ),
                      ],
                    ),
                  const Spacer(),

                  // Price + Detail Button
                  Padding(
                    padding: const EdgeInsets.only(right: 4, bottom: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Price
                        WProductPriceText(price: price),

                        WCircularIcon(
                          icon: TIconString.rightArrow2,
                          padding: const EdgeInsets.all(TSizes.sm),
                          decoration: TGlassDecoration.circle(
                            gradient: TGradients.primary,
                          ),
                          color: TColors.white,
                          width: 34,
                          height: 34,
                          size: 25,
                          onPressed: onPressed ?? () {},
                        ), // Container
                      ],
                    ),
                  ),
                ],
              ), // Column
            ),
          ),
        ],
      ),
    );

    // Ripple overlay sits on top so the splash shows over the image too
    return Stack(
      children: [
        card,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: radius,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onPressed ?? () {},
              splashColor: TColors.primary.withValues(alpha: 0.12),
              highlightColor: TColors.primary.withValues(alpha: 0.05),
            ),
          ),
        ),
      ],
    );
  }
}
