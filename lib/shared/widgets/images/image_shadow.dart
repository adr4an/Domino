import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:flutter/material.dart';

class WImageWithShadow extends StatelessWidget {
  const WImageWithShadow({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.imageWidth,
    this.imageHeight,
    this.boxShadow,
    this.shape = BoxShape.circle,
    this.borderRadius,
  });

  final String imagePath;
  final double? width;
  final double? height;
  final double? imageWidth;
  final double? imageHeight;
  final List<BoxShadow>? boxShadow;
  final BoxShape shape;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: boxShadow,
            ),
          ),
          WDisplayImage(
            imagePath: imagePath,
            width: imageWidth ?? width,
            height: imageHeight ?? height,
            borderRadius: borderRadius ?? 24,
          ),
        ],
      ),
    );
  }
}
