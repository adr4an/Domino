import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

import 'chat_welcome_view.dart';

class ChatEmptyState extends StatelessWidget {
  const ChatEmptyState({super.key, required this.composer, this.chips});

  final Widget composer;
  final Widget? chips;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: TSizes.screenHorizontalPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: TDeviceUtils.getScreenHeight(context) * 0.07),

          const ChatWelcomeView(),
          const SizedBox(height: TSizes.spaceBtwSections),

          // Text input field for user to type their message
          composer,
          const SizedBox(height: TSizes.spaceBtwItems),

          // Optional suggestion chips for quick responses
          if (chips != null) ...[
            const SizedBox(height: TSizes.spaceBtwItems),
            chips!,
          ],
        ],
      ),
    );
  }
}
