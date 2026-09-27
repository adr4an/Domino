import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TGlassDecoration {
  TGlassDecoration._();

  static BoxDecoration circle({
    Color tint = TColors.white,
    double tintOpacity = 0.25,
    double borderOpacity = 0.4,
    double borderWidth = 1,
    Gradient? gradient,
  }) {
    return BoxDecoration(
      color: gradient == null ? tint.withValues(alpha: tintOpacity) : null,
      gradient: gradient,
      shape: BoxShape.circle,
      border: Border.all(
        color: tint.withValues(alpha: borderOpacity),
        width: borderWidth,
      ),
    );
  }

  static BoxDecoration rounded({
    double radius = 20,
    Color tint = TColors.white,
    double tintOpacity = 0.25,
    double borderOpacity = 0.4,
    double borderWidth = 1,
  }) {
    return BoxDecoration(
      color: tint.withValues(alpha: tintOpacity),
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: tint.withValues(alpha: borderOpacity),
        width: borderWidth,
      ),
    );
  }
}
