import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WHomeHeader extends StatelessWidget {
  const WHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Find Your\n',
            style: theme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: 'Favorite ',
            style: theme.headlineMedium?.copyWith(color: TColors.textOrange),
          ),
          TextSpan(text: 'Food.', style: theme.headlineMedium),
        ],
      ),
    );
  }
}
