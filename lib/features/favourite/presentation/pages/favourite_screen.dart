import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/shared/widgets/components/products/cards/product_card_vertical.dart';
import 'package:domino/shared/widgets/icons/circular_icon.dart';
import 'package:domino/shared/widgets/layouts/grid_layout.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/text_strings.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: WAppBar(
        title: TTexts.favourites,
        showBackArrow: false,
        actions: [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: TSpacingStyle.paddingWithAppBar,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('6 ${TTexts.saveItems}', style: theme.labelLarge),
            SizedBox(height: TSizes.spaceBtwItems),

            Expanded(
              child: WGridLayout(
                mainAxisExtent: 240,
                itemCount: TReference.products.length,
                itemBuilder: (_, index) {
                  final products = TReference.products[index];

                  return WProductCardVertical(
                    imageUrl: products['imageUrl'] as String,
                    productName: products['name'] as String,
                    price: products['price'] as String,
                    rightBadgeRightPosition: 6,
                    rightBadgeTopPosition: 8,
                    topRightBadge: WCircularIcon(
                      icon: TIconString.heartFill,
                      padding: const EdgeInsets.all(TSizes.xs),
                      onPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
