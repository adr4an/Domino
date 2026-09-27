import 'package:domino/shared/widgets/effects/glass_blur.dart';
import 'package:domino/shared/widgets/effects/glass_decoration.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WCircularIcon extends StatelessWidget {
  const WCircularIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width = 30,
    this.height = 30,
    this.size = TSizes.iconSm,
    this.padding = EdgeInsets.zero,
    this.color,
    this.decoration,
  });

  final double? width, height, size;
  final EdgeInsetsGeometry padding;
  final String icon;
  final Color? color;
  final BoxDecoration? decoration;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TGlassBlur(
      borderRadius: BorderRadius.circular(50),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: decoration ?? TGlassDecoration.circle(),
            child: Center(
              child: WDisplayIcon(iconPath: icon, size: size, color: color),
            ),
          ),
        ),
      ),
    );
  }
}
