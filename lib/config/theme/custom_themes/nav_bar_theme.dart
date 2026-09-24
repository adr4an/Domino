import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TBottomNavBarTheme {
  TBottomNavBarTheme._();

  static NavigationBarThemeData get lightBottomNavBarTheme =>
      NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TTextTheme.lightTextTheme.labelSmall!.copyWith(
              color: TColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12.5,
            );
          }
          return TTextTheme.lightTextTheme.labelSmall!.copyWith(
            color: TColors.black,
            fontSize: 12.5,
          );
        }),
      );
}
