import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WCheckboxWithAction extends StatelessWidget {
  const WCheckboxWithAction({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.actionLabel,
    this.onActionPressed,
    this.shape,
    this.richLabel,
    this.textTheme,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String? label;
  final Widget? richLabel;
  final String? actionLabel;
  final VoidCallback? onActionPressed;
  final OutlinedBorder? shape;
  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = textTheme ?? Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Row(
            children: [
              Checkbox(
                value: value,
                onChanged: onChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: const VisualDensity(
                  horizontal: -4,
                  vertical: -4,
                ),
                shape: shape,
              ),
              SizedBox(width: TSizes.sm),

              Flexible(
                child:
                    richLabel ??
                    Text(
                      label ?? '',
                      style: TTextTheme.lightTextTheme.labelSmall,
                    ),
              ),
            ],
          ),
        ),

        if (actionLabel != null)
          TextButton(
            onPressed: onActionPressed,
            child: Text(
              actionLabel!,
              style: theme.labelSmall?.copyWith(color: TColors.error),
            ),
          ),
      ],
    );
  }
}
