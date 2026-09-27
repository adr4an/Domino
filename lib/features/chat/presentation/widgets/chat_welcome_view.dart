import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';

class ChatWelcomeView extends StatelessWidget {
  const ChatWelcomeView({super.key, this.subtitle = TChatText.welcomeSubtitle});

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.screenHorizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: TSizes.spaceBtwItems),

          WDisplayImage(imagePath: TIconString.talk, width: 150, height: 150),

          SizedBox(height: TSizes.spaceBtwSections),
          Text.rich(
            TextSpan(
              style: theme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: TColors.textPrimary,
              ),
              children: [
                TextSpan(text: TChatText.welcomeTitlePrefix),
                TextSpan(
                  text: TChatText.welcomeTitleEmphasis,
                  style: theme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: TColors.primary,
                  ),
                ),
                TextSpan(text: TChatText.welcomeTitleSuffix),
              ],
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.bodyMedium?.copyWith(color: TColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
