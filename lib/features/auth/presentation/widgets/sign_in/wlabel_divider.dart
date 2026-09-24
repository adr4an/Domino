import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WLabeledDivider extends StatelessWidget {
  const WLabeledDivider({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 1.5,
            indent: 30,
            endIndent: 8,
          ),
        ),
        Text(label.toUpperCase(), style: TTextTheme.lightTextTheme.bodySmall),
        Flexible(
          child: Divider(
            color: TColors.grey,
            thickness: 1.5,
            indent: 8,
            endIndent: 30,
          ),
        ),
      ],
    );
  }
}
