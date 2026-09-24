import 'package:domino/features/home/presentation/controller/home_controller.dart';
import 'package:domino/features/home/presentation/widgets/home/categ_card.dart';
import 'package:domino/features/home/presentation/widgets/home/home_header.dart';
import 'package:domino/features/home/presentation/widgets/home/promo_slider.dart';
import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/fields/search_bar.dart';
import 'package:domino/shared/widgets/components/products/cards/product_card_vertical.dart';
import 'package:domino/shared/widgets/components/texts/section_heading.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/shared/widgets/layouts/hori_list_view.dart';
import 'package:domino/shared/widgets/products/item_counter_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/icon_string.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            automaticallyImplyLeading: false,
            leadingWidth: kToolbarHeight + TSizes.md,
            leading: Padding(
              padding: const EdgeInsets.only(left: TSizes.md),
              child: IconButton(
                onPressed: () {},
                icon: WDisplayIcon(iconPath: TIconString.menu),
              ),
            ),
            actionsPadding: const EdgeInsets.only(right: TSizes.md),
            actions: [
              WCounterIcon(
                icon: TIconString.notif,
                label: '3',
                iconColor: TColors.black,
                badgeColor: TColors.error,
                badgeRight: 4,
              ),
              WCounterIcon(
                icon: TIconString.cart,
                label: '8',
                iconColor: TColors.black,
                badgeColor: TColors.error,
              ),
            ],
          ),

          SliverToBoxAdapter(
            child: SafeArea(
              top: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header + Search Bar
                  Padding(
                    padding: TSpacingStyle.paddingWithAppBar,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        WHomeHeader(),
                        SizedBox(height: TSizes.spaceBtwItems),

                        // Search Bar
                        Obx(
                          () => WSearchBar(
                            label: "Let's find your cravings",
                            controller: controller.searchController,
                            onChanged: controller.updateSearchText,
                            showClearButton: controller.hasSearchText.value,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  // Categories
                  WHoriListView(
                    height: 75,
                    itemCount: TIconString.iconCateg.length,
                    itemBuilder: (context, index) {
                      final category = TIconString.iconCateg[index];

                      return CategoryCard(
                        label: category['label']!,
                        imageAsset: category['image']!,
                      );
                    },
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  // Banners + Most Popular + Product Layout
                  Padding(
                    padding: TSpacingStyle.paddingWithAppBar,
                    child: Column(
                      children: [
                        WPromoSlider(
                          controller: controller,
                          banners: TImageString.promoBanners,
                        ),
                        SizedBox(height: TSizes.spaceBtwSections),

                        // Most Popular + See All
                        WSectionHeading(
                          title: 'Most Popular',
                          buttonTitle: 'See All',
                          onPressed: controller.goToStore,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  // Products
                  WHoriListView(
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
                        ),
                      );
                    },
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
