import 'package:domino/config/theme/custom_themes/app_bar_theme.dart';
import 'package:domino/config/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:domino/config/theme/custom_themes/checkbox_theme.dart';
import 'package:domino/config/theme/custom_themes/chip_theme.dart';
import 'package:domino/config/theme/custom_themes/elevated_button_theme.dart';
import 'package:domino/config/theme/custom_themes/nav_bar_theme.dart';
import 'package:domino/config/theme/custom_themes/outlined_button_theme.dart';
import 'package:domino/config/theme/custom_themes/text_btn_theme.dart';
import 'package:domino/config/theme/custom_themes/text_field_theme.dart';
import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    scaffoldBackgroundColor: TColors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    navigationBarTheme: TBottomNavBarTheme.lightBottomNavBarTheme,

    // InkWell / ripple theming
    splashColor: Colors.black.withValues(alpha: 0.05),
    highlightColor: Colors.black.withValues(alpha: 0.05),
    splashFactory: InkRipple.splashFactory,
  );
}
