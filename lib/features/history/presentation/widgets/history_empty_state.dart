import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WHistoryEmptyState extends StatelessWidget {
  const WHistoryEmptyState({
    super.key,
    required this.image,
    required this.statusLabel,
  });

  final String image;
  final String statusLabel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image, width: 160, height: 160, fit: BoxFit.contain),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            'No ${statusLabel.toLowerCase()} orders yet',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
