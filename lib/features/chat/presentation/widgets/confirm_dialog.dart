// lib/shared/widgets/dialogs/w_confirm_dialog.dart
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';

class WConfirmDialog extends StatelessWidget {
  const WConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
    this.confirmText = TChatText.confirm,
    this.cancelText = TChatText.cancel,
    this.icon,
    this.iconColor = TColors.darkGrey,
    this.confirmColor = TColors.primary,
    this.cancelColor = TColors.darkGrey,
    this.backgroundColor = TColors.white,
    this.radius = 24,
    this.padding = const EdgeInsets.fromLTRB(24, 24, 24, 20),
    this.buttonHeight = 44,
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final String confirmText;
  final String cancelText;
  final IconData? icon;
  final Color iconColor;
  final Color confirmColor;
  final Color cancelColor;
  final Color backgroundColor;
  final double radius;
  final EdgeInsetsGeometry padding;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Dialog(
      backgroundColor: backgroundColor,
      insetPadding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TSizes.sm),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 32, color: iconColor),
              const SizedBox(height: TSizes.spaceBtwItems),
            ],
            Text(
              title,
              style: theme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              message,
              style: theme.labelSmall?.copyWith(color: TColors.textSecondary),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => onCancel(),
                    child: Text(cancelText),
                  ),
                ),
                const SizedBox(width: TSizes.sm),

                Expanded(
                  child: ElevatedButton(
                    onPressed: () => onConfirm(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.black,
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(color: TColors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
