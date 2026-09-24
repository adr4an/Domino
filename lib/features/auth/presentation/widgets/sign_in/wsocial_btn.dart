import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WSocialButton extends StatelessWidget {
  const WSocialButton({
    super.key,
    this.textTheme,
    this.textColor = TColors.black,
    this.bgColor = TColors.white,
    this.iconSize = TSizes.iconSm,
    this.iconColor,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  final String label;
  final String imagePath;
  final VoidCallback onPressed;
  final TextTheme? textTheme;
  final Color? textColor;
  final Color? bgColor;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = textTheme ?? Theme.of(context).textTheme;

    return Material(
      color: bgColor,
      borderRadius: BorderRadius.circular(14),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(BorderSide(color: TColors.grey)),
            borderRadius: BorderRadius.all(Radius.circular(14)),
            boxShadow: TShadowStyle.button,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              WDisplayIcon(
                iconPath: imagePath,
                size: iconSize,
                color: iconColor,
              ),
              SizedBox(width: TSizes.sm),

              // Label
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.labelMedium?.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
