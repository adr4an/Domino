import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme get lightTextTheme => TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: TColors.black,
      letterSpacing: -0.1,
    ),

    headlineMedium: const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: -0.1,
    ),

    headlineSmall: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: -0.1,
      height: 1.3,
    ),

    titleLarge: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      letterSpacing: -0.1,
    ),

    titleMedium: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: TColors.black,
      letterSpacing: -0.1,
    ),

    titleSmall: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TColors.black,
      letterSpacing: -0.1,
    ),

    bodyLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TColors.black,
      letterSpacing: -0.1,
      height: 1.5,
    ),

    bodyMedium: const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TColors.black,
      letterSpacing: -0.1,
      height: 1.5,
    ),

    bodySmall: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: TColors.black,
      letterSpacing: -0.1,
      height: 1.4,
    ),

    labelLarge: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: TColors.black,
      letterSpacing: -0.1,
    ),

    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: TColors.black,
      letterSpacing: -0.1,
    ),

    labelSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: TColors.black,
      letterSpacing: -0.1,
    ),
  ); // TextTheme
}
