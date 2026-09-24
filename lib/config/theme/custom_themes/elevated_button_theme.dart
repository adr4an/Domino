import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData get lightElevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: TColors.white,
          backgroundColor: TColors.darkerGrey,
          disabledForegroundColor: TColors.grey,
          disabledBackgroundColor: TColors.light,
          side: const BorderSide(color: TColors.darkerGrey),
          padding: const EdgeInsets.symmetric(vertical: TSizes.md),
          textStyle: TTextTheme.lightTextTheme.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
        ),
      );
}
