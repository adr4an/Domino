import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WCircularIcon extends StatelessWidget {
  const WCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.iconSm,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final Widget icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? TColors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
