import 'package:domino/features/home/presentation/controller/home_controller.dart';
import 'package:domino/features/home/presentation/widgets/home_app_bar.dart';
import 'package:domino/features/home/presentation/widgets/home_categories.dart';
import 'package:domino/features/home/presentation/widgets/home_header.dart';
import 'package:domino/features/home/presentation/widgets/home_product.dart';
import 'package:domino/features/home/presentation/widgets/promo_slider.dart';
import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/fields/search_bar.dart';
import 'package:domino/shared/widgets/components/texts/section_heading.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/reference.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/home_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;

    return Scaffold(
      backgroundColor: TColors.grey200,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            WHomeAppBar(controller: controller),
            SliverToBoxAdapter(child: SizedBox(height: TSizes.sm)),

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
                              label: THomeText.searchHintText,
                              controller: controller.searchController,
                              onChanged: controller.updateSearchText,
                              showClearButton: controller.hasSearchText.value,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.sm),

                    // Categories
                    const WHomeCategories(),
                    SizedBox(height: TSizes.sm),

                    // Banners + Most Popular + Product Layout
                    Padding(
                      padding: TSpacingStyle.paddingWithAppBar,
                      child: Column(
                        children: [
                          WPromoSlider(
                            controller: controller,
                            banners: TReference.promoBanners,
                          ),
                          SizedBox(height: TSizes.spaceBtwSections),

                          // Most Popular + See All
                          WSectionHeading(
                            title: THomeText.mostPopular,
                            buttonTitle: THomeText.seeAll,
                            onPressed: controller.goToStore,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Products
                    HomeProductsView(),
                    SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: TSizes.spaceBtwItems, // 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
