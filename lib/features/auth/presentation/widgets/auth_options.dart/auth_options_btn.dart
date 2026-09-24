import 'package:domino/features/auth/presentation/widgets/sign_in/wsocial_btn.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class AuthOptionsSocialButtons extends StatelessWidget {
  const AuthOptionsSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WSocialButton(
          label: TTexts.continueWithFacebook,
          imagePath: TImageString.facebookLogo,
          bgColor: TColors.dark,
          textColor: TColors.white,
          iconColor: TColors.white,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.sm),

        WSocialButton(
          label: TTexts.continueWithGoogle,
          imagePath: TImageString.googleLogo,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.sm),

        WSocialButton(
          label: TTexts.continueWithEmail,
          imagePath: TImageString.emailLogo,
          onPressed: () {},
        ),
      ],
    );
  }
}
