import 'package:domino/features/auth/presentation/widgets/sign_in/wsocial_btn.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:flutter/material.dart';

class AuthOptionsSocialButtons extends StatelessWidget {
  const AuthOptionsSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WSocialButton(
          label: TAuthText.continueWithFacebook,
          imagePath: TImageString.facebookLogo,
          bgColor: TColors.dark,
          textColor: TColors.white,
          iconColor: TColors.white,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.sm),

        WSocialButton(
          label: TAuthText.continueWithGoogle,
          imagePath: TImageString.googleLogo,
          onPressed: () {},
        ),
        SizedBox(height: TSizes.sm),

        WSocialButton(
          label: TAuthText.continueWithEmail,
          imagePath: TImageString.emailLogo,
          onPressed: () {},
        ),
      ],
    );
  }
}
