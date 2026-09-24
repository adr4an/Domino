import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/gradients.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WGradientButton extends StatelessWidget {
  const WGradientButton({
    super.key,
    required this.textLabel,
    required this.onPressed,
    this.gradient,
    this.textColor = TColors.white,
  });

  final String textLabel;
  final VoidCallback? onPressed;
  final Color textColor;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
        color: isDisabled ? TColors.buttonDisabled : null,
        gradient: isDisabled ? null : gradient ?? TGradients.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(30),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: Text(
                textLabel,
                style: TTextTheme.lightTextTheme.labelMedium?.copyWith(
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
