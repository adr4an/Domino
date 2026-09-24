import 'package:flutter/material.dart';
import 'package:domino/utils/constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData get lightChipTheme => ChipThemeData(
    backgroundColor: TColors.lightGrey,
    disabledColor: TColors.grey,
    labelStyle: const TextStyle(color: TColors.darkerGrey),
    selectedColor: TColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
    checkmarkColor: TColors.white,
    elevation: 0,
  );
}
