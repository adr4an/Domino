import 'package:flutter/material.dart';

class WCircularImage extends StatelessWidget {
  const WCircularImage({
    super.key,
    required this.imagePath,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.backgroundColor = Colors.transparent,
  });

  final String imagePath;
  final double width;
  final double height;
  final BoxFit fit;
  final bool isNetworkImage;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final image = isNetworkImage
        ? Image.network(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: _buildErrorImage,
          )
        : Image.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: _buildErrorImage,
          );

    return ClipOval(
      child: SizedBox(
        width: width,
        height: height,
        child: ColoredBox(color: backgroundColor, child: image),
      ),
    );
  }

  Widget _buildErrorImage(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return ColoredBox(
      color: backgroundColor,
      child: const Center(child: Icon(Icons.person_outline)),
    );
  }
}
