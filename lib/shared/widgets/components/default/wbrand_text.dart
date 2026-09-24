import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class WBrandName extends StatelessWidget {
  const WBrandName({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      children: [
        WDisplayIcon(iconPath: TImageString.appLogo, size: 35),
        SizedBox(width: TSizes.sm),

        Text(
          TTexts.appName,
          style: theme.headlineSmall?.copyWith(letterSpacing: -.8),
        ),
      ],
    );
  }
}
