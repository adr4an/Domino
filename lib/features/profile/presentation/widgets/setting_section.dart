import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final List<Widget> children;

  const SettingsSection({
    super.key,
    required this.title,
    this.trailing,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Text(title, style: theme.bodyLarge),
        SizedBox(height: TSizes.spaceBtwItems),

        // White Card with items
        WRoundedContainer(
          radius: TSizes.cardRadiusMd,
          child: Column(
            children: children.asMap().entries.map((entry) {
              final isLast = entry.key == children.length - 1;
              return Column(
                children: [
                  entry.value,
                  if (!isLast)
                    Divider(
                      height: 1,
                      indent: 16,
                      endIndent: 16,
                      color: Colors.grey.shade100,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
