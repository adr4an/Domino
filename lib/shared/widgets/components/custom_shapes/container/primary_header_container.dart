import 'package:domino/shared/widgets/components/custom_shapes/container/circular_container.dart';
import 'package:domino/shared/widgets/components/custom_shapes/curved_edges/curved_widget.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/gradients.dart';
import 'package:flutter/material.dart';

class WPrimaryHeaderContainer extends StatelessWidget {
  const WPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WCurvedWidget(
      widget: Container(
        decoration: const BoxDecoration(gradient: TGradients.home),
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -250,
              child: WCircularContainer(
                backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: WCircularContainer(
                backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
              ),
            ),

            child,
          ],
        ), // SizedBox
      ),
    );
  }
}
