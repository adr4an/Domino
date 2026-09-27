import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:flutter/material.dart';

/// "+63 |" prefix shown inside phone number fields.
class WPhonePrefix extends StatelessWidget {
  const WPhonePrefix({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            TAuthText.phonePrefix,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(width: 8),
          Container(width: 1, height: 20, color: TColors.borderPrimary),
        ],
      ),
    );
  }
}
