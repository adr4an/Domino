import 'package:domino/shared/styles/shadows.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// Segmented tab selector with a sliding orange indicator.
class WSegmentedTabSelector extends StatelessWidget {
  const WSegmentedTabSelector({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: TColors.grey100,
        border: Border.all(color: TColors.borderSecondary),
        // Outer radius = indicator radius (4) + padding (4), so corners stay concentric.
        borderRadius: BorderRadius.circular(TSizes.borderRadiusMd),
        boxShadow: TShadowStyle.subtleShadow,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final tabWidth = constraints.maxWidth / labels.length;

          return SizedBox(
            height: 40,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOutCubic,
                  left: selectedIndex * tabWidth,
                  top: 0,
                  bottom: 0,
                  width: tabWidth,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: TColors.textOrange,
                        borderRadius: BorderRadius.circular(
                          TSizes.borderRadiusSm,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: TColors.textOrange.withValues(alpha: 0.35),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: List.generate(labels.length, (index) {
                    final isSelected = selectedIndex == index;

                    return Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => onTabSelected(index),
                          borderRadius: BorderRadius.circular(
                            TSizes.borderRadiusSm,
                          ),
                          splashFactory: NoSplash.splashFactory,
                          child: SizedBox.expand(
                            child: Center(
                              child: AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: theme.labelMedium!.copyWith(
                                  color: isSelected
                                      ? TColors.white
                                      : TColors.black,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w600,
                                ),
                                child: Text(
                                  labels[index],
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
