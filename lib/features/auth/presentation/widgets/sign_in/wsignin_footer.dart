import 'package:domino/features/auth/presentation/pages/sign_up.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wauth_footer.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wsocial_btn.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class WSignInFooter extends StatelessWidget {
  const WSignInFooter({super.key, required this.textTheme});

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WSocialButton(
          label: TTexts.continueWithGoogle,
          imagePath: TImageString.googleLogo,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        WSocialButton(
          label: TTexts.continueWithFacebook,
          imagePath: TImageString.facebookLogo,
          bgColor: TColors.black,
          textColor: TColors.white,
          iconColor: TColors.white,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.spaceBtwItems),

        // Don't have an account? Create Account
        WAuthFooter(
          label: TTexts.dontHaveAccount,
          btnLabel: TTexts.createAccount,
          onTap: () => Get.off(() => SignUpScreen()),
        ),
      ],
    );
  }
}
