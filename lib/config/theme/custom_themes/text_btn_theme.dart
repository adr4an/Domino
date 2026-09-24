import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static TextButtonThemeData get lightTextButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: TColors.primary,
      textStyle: TTextTheme.lightTextTheme.labelSmall,
    ),
  );
}
