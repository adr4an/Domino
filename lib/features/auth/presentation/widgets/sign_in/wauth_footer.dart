import 'package:flutter/material.dart';

class WAuthFooter extends StatelessWidget {
  const WAuthFooter({
    super.key,
    this.textTheme,
    required this.label,
    required this.btnLabel,
    required this.onTap,
  });

  final TextTheme? textTheme;
  final String label;
  final String btnLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = textTheme ?? Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: theme.labelSmall),

        TextButton(
          onPressed: onTap,
          child: Text(
            btnLabel,
            style: theme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
