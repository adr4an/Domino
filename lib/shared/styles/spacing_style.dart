import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithoutAppBar = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingWithAppBar = EdgeInsets.symmetric(
    horizontal: TSizes.defaultSpace,
    vertical: TSizes.sm,
  );
}
