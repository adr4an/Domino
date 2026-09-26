import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HistoryTabButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const HistoryTabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? color : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: theme.labelMedium!.copyWith(
                color: isSelected ? TColors.white : TColors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
