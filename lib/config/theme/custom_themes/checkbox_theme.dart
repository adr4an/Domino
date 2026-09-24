import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData get lightCheckboxTheme => CheckboxThemeData(
    shape: CircleBorder(),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.white;
      } else {
        return TColors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TColors.error;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
