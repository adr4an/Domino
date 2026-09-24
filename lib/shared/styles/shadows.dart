import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TShadowStyle {
  TShadowStyle._();

  static const List<BoxShadow> subtleShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
  ];

  static const List<BoxShadow> button = [
    BoxShadow(color: Color(0x14000000), blurRadius: 10, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> onboardingGlow = [
    BoxShadow(
      color: Color(0x40AD9A7D),
      blurRadius: 24,
      spreadRadius: 4,
      offset: Offset(0, 10),
    ),
  ];

  static final List<BoxShadow> secondaryGlow = [
    BoxShadow(
      color: TColors.buttonSecondary.withValues(alpha: 0.25),
      blurRadius: 24,
      spreadRadius: 4,
      offset: const Offset(0, 10),
    ),
  ];

  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  ); // BoxShadow

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  ); //
}
