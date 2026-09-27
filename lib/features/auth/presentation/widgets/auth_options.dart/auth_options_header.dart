import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/components/default/wauth_header.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AuthOptionsHeader extends StatelessWidget {
  const AuthOptionsHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WDisplayImage(
          imagePath: TImageString.appLogoFg,
          width: 65,
          height: 65,
          borderRadius: TSizes.md,
          boxShadow: TShadowStyle.subtleShadow,
        ),
        SizedBox(height: TSizes.spaceBtwSections),

        WAuthHeader(headTitle: title, headSubTititle: subTitle),
      ],
    );
  }
}
