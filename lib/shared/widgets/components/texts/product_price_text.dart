import 'package:flutter/material.dart';

class WProductPriceText extends StatelessWidget {
  const WProductPriceText({
    super.key,
    this.currencySign = '₱',
    required this.price,
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Text(
      currencySign + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? theme.headlineMedium!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : theme.labelLarge!.copyWith(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.bold,
            ),
    );
  }
}
