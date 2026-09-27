import 'package:domino/features/home/presentation/controller/home_controller.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/circular_container.dart';
import 'package:domino/shared/widgets/images/rounded_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WPromoSlider extends StatelessWidget {
  const WPromoSlider({
    super.key,
    required this.controller,
    required this.banners,
  });

  final HomeController controller;
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ), // CarouselOptions
          items: banners
              .map(
                (img) => WRoundedImage(
                  imageUrl: img,
                  borderRadius: TSizes.borderRadiusXl,
                ),
              )
              .toList(),
        ), // CarouselSlider
        const SizedBox(height: TSizes.spaceBtwItems),

        Obx(
          () => Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  WCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: i == controller.carouselCurrentIndex.value
                        ? TColors.secondary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        ), // Row
      ],
    );
  }
}
