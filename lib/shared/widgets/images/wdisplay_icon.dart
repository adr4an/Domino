import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WDisplayIcon extends StatelessWidget {
  const WDisplayIcon({
    super.key,
    required this.iconPath,
    this.size = TSizes.iconMd,
    this.width,
    this.height,
    this.padding,
    this.backgroundColor,
    this.borderRadius,
    this.color,
  });

  final String iconPath;
  final double? size;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Widget icon = Image.asset(
      iconPath,
      width: width ?? size,
      height: height ?? size,
      fit: BoxFit.contain,
    );

    if (color != null) {
      icon = ColorFiltered(
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
        child: icon,
      );
    }

    if (padding == null && backgroundColor == null) {
      return icon;
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: icon,
    );
  }
}
