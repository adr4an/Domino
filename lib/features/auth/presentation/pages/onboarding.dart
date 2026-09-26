import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/images/image_shadow.dart';
import 'package:domino/features/auth/presentation/controllers/onboarding_controllers.dart';
import 'package:domino/shared/widgets/components/default/wbrand_text.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/onboarding_text.dart';
import 'package:domino/utils/constants/texts/text_strings.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: TColors.light,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: TSizes.defaultSpace),

                WBrandName(),
                const SizedBox(height: TSizes.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.49,
                  child: Center(
                    child: WImageWithShadow(
                      imagePath: TImageString.pizzaOnboarding,
                      width: 275,
                      height: 275,
                      boxShadow: TShadowStyle.onboardingGlow,
                    ),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),

                Text(
                  TOnboardingText.onBoardingHeader,
                  style: textTheme.headlineSmall?.copyWith(
                    height: 1.4,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems),

                Text(
                  TOnboardingText.onBoardingSubTitle,
                  style: textTheme.bodyMedium,
                ),
                const Spacer(),

                /// Get Started button
                SizedBox(
                  width: TDeviceUtils.getScreenWidth(context) * 0.9,
                  child: WGradientButton(
                    onPressed: () {
                      controller.goToHome();
                    },
                    textLabel: TTexts.getStarted,
                  ),
                ),
                const SizedBox(height: TSizes.md),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
