import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/features/auth/presentation/pages/sign_in.dart';
import 'package:domino/features/auth/presentation/widgets/auth_options.dart/auth_options_btn.dart';
import 'package:domino/features/auth/presentation/widgets/auth_options.dart/auth_options_header.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wlabel_divider.dart';
import 'package:domino/features/auth/presentation/widgets/sign_up/wsignup_terms.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AuthOptionsScreen extends StatelessWidget {
  const AuthOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: TSpacingStyle.paddingWithoutAppBar,
            child: Column(
              children: [
                // Logo, Header
                AuthOptionsHeader(),
                SizedBox(height: TSizes.spaceBtwSections),

                // Continue Button
                WGradientButton(
                  textLabel: TTexts.tContinue,
                  onPressed: () {
                    Get.to(() => const SignInScreen());
                  },
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                // Divider
                WLabeledDivider(label: TTexts.or),
                SizedBox(height: TSizes.spaceBtwSections),

                // 3 Social Buttons
                AuthOptionsSocialButtons(),
                SizedBox(height: TSizes.spaceBtwSections),

                // Terms And Policy
                WTermsAndAgreement(
                  prefixText: TTexts.agreementPrefix,
                  termsText: TTexts.termsOfService,
                  conjunctionText: TTexts.agreementAnd,
                  privacyText: TTexts.agreementPrivacyPolicy,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
