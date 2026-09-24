import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WVerticalImageText extends StatelessWidget {
  const WVerticalImageText({
    super.key,
    required this.label,
    required this.imagePath,
    this.textColor = TColors.lightGrey,
    this.bgColor = Colors.white,
    this.onTap,
  });

  final String label;
  final String imagePath;
  final Color textColor;
  final Color bgColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(100),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.sm),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(child: WDisplayIcon(iconPath: imagePath, size: 35)),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          SizedBox(
            width: 75,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: theme.labelSmall!.copyWith(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
