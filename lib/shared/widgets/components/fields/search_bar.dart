import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/image/icon_string.dart';
import 'package:flutter/material.dart';

class WSearchBar extends StatelessWidget {
  const WSearchBar({
    super.key,
    required this.label,
    this.controller,
    this.onChanged,
    this.onSearchPressed,
    this.iconColor = TColors.darkerGrey,
    this.showClearButton = false,
  });

  final String label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onSearchPressed;
  final Color iconColor;
  final bool showClearButton;

  @override
  Widget build(BuildContext context) {
    return WtextField(
      label: label,
      controller: controller,
      onChanged: onChanged,
      onPreIconPressed: onSearchPressed,
      showClearButton: showClearButton,
      fillColor: TColors.grey200,
      borderColor: Colors.grey.shade400,
      borderWidth: 1,
      focusedBorderWidth: 1,
      preIcon: WDisplayIcon(iconPath: TIconString.search, color: iconColor),
    );
  }
}
