import 'package:domino/shared/widgets/components/products/cards/product_card_vertical.dart';
import 'package:domino/shared/widgets/components/texts/custom_badge.dart';
import 'package:domino/shared/widgets/layouts/hori_list_view.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeProductsView extends StatelessWidget {
  const HomeProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return WHoriListView(
      itemCount: TReference.products.length,
      height: TSizes.productCardHeight,
      itemBuilder: (_, index) {
        final products = TReference.products[index];

        return SizedBox(
          width: 220,
          child: WProductCardVertical(
            imageUrl: products['imageUrl'] as String,
            calories: products['calories'] as String,
            productName: products['name'] as String,
            deliveryTime: products['deliveryTime'] as String,
            description: products['description'] as String,
            price: products['price'] as String,
            topLeftBadge: WCustomBadge(
              iconPath: TIconString.fire,
              label: '324',
              roundLeft: false,
            ),
            topRightBadge: WCustomBadge(
              iconPath: TIconString.clock,
              label: '15 min',
              roundRight: false,
            ),
          ),
        );
      },
    );
  }
}
