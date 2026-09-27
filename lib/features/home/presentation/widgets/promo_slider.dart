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
    this.borderRadius = TSizes.borderRadiusMd,
    this.height,
    this.isNetworkImage = false,
  });

  final HomeController controller;
  final List<String> banners;
  final double borderRadius;
  final double? height;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: height,
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ), // CarouselOptions
          items: banners
              .map(
                (img) => WRoundedImage(
                  imageUrl: img,
                  width: double.infinity,
                  // Cover fills the slide so the clipped corners land on the image
                  fit: BoxFit.cover,
                  isNetworkImage: isNetworkImage,
                  borderRadius: borderRadius,
                ),
              )
              .toList(),
        ), // CarouselSlider
        const SizedBox(height: TSizes.spaceBtwItems),

        // Page indicator
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
      ],
    );
  }
}
