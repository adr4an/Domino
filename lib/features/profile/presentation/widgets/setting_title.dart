import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WSettingsTile extends StatelessWidget {
  final String? iconPath;
  final String label;
  final String? value;
  final VoidCallback? onTap;
  final bool showArrow;

  const WSettingsTile({
    super.key,
    this.iconPath,
    required this.label,
    this.value,
    this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Icon
            if (iconPath != null) ...[
              if (iconPath != null)
                Image.asset(
                  iconPath!,
                  width: 20,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              SizedBox(width: TSizes.spaceBtwItems),

              // Label
              Expanded(
                child: Text(
                  label,
                  style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                ),
              ),

              // Value (optional)
              if (value != null)
                Text(
                  value!,
                  style: theme.labelMedium?.copyWith(color: TColors.darkerGrey),
                ),
              SizedBox(width: TSizes.xs),

              // Arrow
              if (showArrow) ...[
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Colors.grey.shade400,
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
