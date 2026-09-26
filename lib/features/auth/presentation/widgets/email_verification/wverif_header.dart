import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:flutter/material.dart';

class WVerificationHeader extends StatelessWidget {
  const WVerificationHeader({super.key, required this.email, this.textStye});

  final String email;
  final TextTheme? textStye;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          TAuthText.verifyEmailTitle,
          style: theme.headlineSmall?.copyWith(
            letterSpacing: -.1,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: TSizes.sm),

        Text(TAuthText.verifyEmailSubTitle, style: theme.bodyMedium),
        SizedBox(height: TSizes.xs),

        Text(
          email,
          style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
