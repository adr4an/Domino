import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WHoriListView extends StatelessWidget {
  const WHoriListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.height,
    this.itemSpacing = TSizes.md,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double height;
  final double itemSpacing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => SizedBox(width: itemSpacing),
        padding: const EdgeInsets.only(
          left: TSizes.lg,
          right: TSizes.lg,
          bottom: TSizes.xs,
        ),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
