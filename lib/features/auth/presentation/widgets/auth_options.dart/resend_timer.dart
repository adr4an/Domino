import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WResendTimerText extends StatelessWidget {
  const WResendTimerText({
    super.key,
    required this.label,
    required this.timerText,
    this.labelStyle,
    this.timerStyle,
    this.textTheme,
  });

  final String label;
  final int timerText;
  final TextStyle? labelStyle;
  final TextStyle? timerStyle;
  final TextTheme? textTheme;

  @override
  Widget build(BuildContext context) {
    final theme = textTheme ?? Theme.of(context).textTheme;

    return Text.rich(
      TextSpan(
        text: '$label ',
        style: labelStyle ?? theme.bodyMedium?.copyWith(color: Colors.grey),
        children: [
          TextSpan(
            text: '${timerText}s',
            style:
                timerStyle ??
                const TextStyle(
                  color: TColors.error,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
