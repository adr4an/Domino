import 'package:flutter/material.dart';

class WTermsAndAgreement extends StatelessWidget {
  const WTermsAndAgreement({
    super.key,
    required this.prefixText,
    required this.termsText,
    required this.conjunctionText,
    required this.privacyText,
    this.textStyle,
    this.linkStyle,
    this.textAlign = TextAlign.start,
  });

  final String prefixText;
  final String termsText;
  final String conjunctionText;
  final String privacyText;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: prefixText,
        style: textStyle ?? Theme.of(context).textTheme.labelSmall,
        children: [
          TextSpan(
            text: termsText,
            style:
                linkStyle ??
                Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
          ),

          TextSpan(
            text: conjunctionText,
            style: textStyle ?? Theme.of(context).textTheme.labelSmall,
          ),

          TextSpan(
            text: privacyText,
            style:
                linkStyle ??
                Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  decoration: TextDecoration.underline,
                ),
          ),
        ],
      ),
      textAlign: textAlign,
    );
  }
}
