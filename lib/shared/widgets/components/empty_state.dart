import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// Centered placeholder for empty lists: an image or icon, a title,
// and an optional message.
class WEmptyState extends StatelessWidget {
  const WEmptyState({
    super.key,
    required this.title,
    this.message,
    this.image,
    this.icon,
    this.visualSize = 160,
  }) : assert(
         image != null || icon != null,
         'Provide either an image or an icon.',
       );

  final String title;
  final String? message;
  final String? image;
  final IconData? icon;
  final double visualSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Align(
      alignment: const Alignment(0, -0.25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image or Icon
            if (image != null)
              Image.asset(
                image!,
                width: visualSize,
                height: visualSize,
                fit: BoxFit.contain,
              )
            else
              Icon(icon, size: visualSize, color: TColors.darkGrey),
            const SizedBox(height: TSizes.spaceBtwItems),

            // Title + Message
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
            ),

            if (message != null) ...[
              const SizedBox(height: TSizes.xs),
              Text(
                message!,
                textAlign: TextAlign.center,
                style: theme.bodySmall?.copyWith(color: TColors.darkerGrey),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
