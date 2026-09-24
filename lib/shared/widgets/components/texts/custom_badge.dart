import 'dart:ui';

import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WCustomBadge extends StatelessWidget {
  const WCustomBadge({
    super.key,
    required this.iconPath,
    required this.label,
    this.iconSize = TSizes.iconSm,
    this.textColor = TColors.dark,
    this.iconColor = TColors.dark,
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
    this.roundLeft = true,
    this.roundRight = true,
    this.radius = 20,
  });

  final String iconPath;
  final String label;
  final double iconSize;
  final Color textColor;
  final Color iconColor;
  final EdgeInsetsGeometry padding;
  final bool roundLeft;
  final bool roundRight;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(roundLeft ? radius : 0),
      bottomLeft: Radius.circular(roundLeft ? radius : 0),
      topRight: Radius.circular(roundRight ? radius : 0),
      bottomRight: Radius.circular(roundRight ? radius : 0),
    );

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.28),
            borderRadius: borderRadius,
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.55),
              width: 1,
            ),
            boxShadow: TShadowStyle.onboardingGlow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: iconSize,
                height: iconSize,
                child: WDisplayIcon(
                  iconPath: iconPath,
                  size: iconSize,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: TSizes.xs),

              Text(
                label,
                style: theme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
