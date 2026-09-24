import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WSectionHeading extends StatelessWidget {
  const WSectionHeading({
    super.key,
    this.onPressed,
    this.textColor = TColors.black,
    this.buttonTitle,
    required this.title,
    this.showActionButton = true,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title;
  final String? buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              buttonTitle ?? '',
              style: theme.labelMedium?.copyWith(color: TColors.primary),
            ),
          ),
      ],
    ); // Row
  }
}
