import 'package:domino/features/auth/presentation/pages/sign_in.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wauth_footer.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wsocial_btn.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class WSignUpFooter extends StatelessWidget {
  const WSignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Social Buttons
        Row(
          children: [
            Expanded(
              child: WSocialButton(
                label: TTexts.google,
                imagePath: TImageString.googleLogo,
                onPressed: () {},
              ),
            ),
            SizedBox(width: TSizes.sm),

            Expanded(
              child: WSocialButton(
                label: TTexts.facebook,
                imagePath: TImageString.facebookLogo,
                bgColor: TColors.black,
                textColor: TColors.white,
                iconColor: TColors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: TSizes.sm),

        WAuthFooter(
          label: TTexts.alreadyHaveAnAccount,
          btnLabel: TTexts.signIn,
          onTap: () => Get.off(() => SignInScreen()),
        ),
      ],
    );
  }
}
