import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WAuthHeader extends StatelessWidget {
  const WAuthHeader({
    super.key,
    this.textTheme,
    required this.headTitle,
    required this.headSubTititle,
  });

  final TextTheme? textTheme;
  final String headTitle;
  final String headSubTititle;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = textTheme ?? Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          headTitle,
          style: theme.headlineSmall?.copyWith(
            letterSpacing: -.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: TSizes.sm),

        Text(
          headSubTititle,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: theme.bodyMedium?.copyWith(
            color: theme.bodyMedium?.color?.withValues(alpha: .7),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: TSizes.sm),
      ],
    );
  }
}
