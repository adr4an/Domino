import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:flutter/material.dart';

class WResendCodeSection extends StatelessWidget {
  const WResendCodeSection({
    super.key,
    required this.isTimerRunning,
    required this.codeTimer,
    required this.onResendPressed,
  });

  final bool isTimerRunning;
  final String codeTimer;
  final VoidCallback onResendPressed;

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(TAuthText.didNotReceiveCode),
        SizedBox(height: TSizes.xs),

        if (isTimerRunning)
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.bodyMedium,
              children: [
                TextSpan(text: '${TAuthText.resendCodeIn} '),
                TextSpan(
                  text: codeTimer,
                  style: theme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: TColors.error,
                  ),
                ),
              ],
            ),
          )
        else
          // State 2: timer expired, tappable
          TextButton(
            onPressed: onResendPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              TAuthText.resendCode,
              style: theme.labelMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: TColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}
