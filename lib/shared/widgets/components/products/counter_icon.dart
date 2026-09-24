import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class WCounterIcon extends StatelessWidget {
  const WCounterIcon({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = TColors.white,
    this.digitColor = TColors.lightGrey,
    this.badgeColor = TColors.black,
    this.badgeTop = 5,
    this.badgeRight = 0,
  });

  final String icon;
  final String label;
  final Color? digitColor;
  final Color iconColor;
  final Color badgeColor;
  final double badgeTop;
  final double badgeRight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: WDisplayIcon(iconPath: icon, color: iconColor),
        ),

        Positioned(
          right: badgeRight,
          top: badgeTop,
          child: Container(
            constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            height: 18,
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: BorderRadius.circular(100),
            ), // BoxDecoration
            child: Center(
              child: Text(
                label,
                style: theme.labelLarge!.apply(
                  color: digitColor,
                  fontSizeFactor: 0.8,
                ),
              ),
            ), // Center
          ), // Container
        ), // Positioned
      ],
    );
  }
}
