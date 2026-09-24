import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WDisplayImage extends StatelessWidget {
  const WDisplayImage({
    super.key,
    required this.imagePath,
    this.isUrl = false,
    this.width,
    this.height,
    this.fit,
    this.borderRadius = 0,
    this.boxShadow,
  });

  final String imagePath;
  final bool isUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double borderRadius;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final isSvg = imagePath.toLowerCase().contains('.svg');

    if (isUrl) {
      if (isSvg) {
        return _imageWithShadow(
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SvgPicture.network(
              imagePath,
              width: width,
              height: height,
              fit: fit ?? BoxFit.contain,
              placeholderBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      }
      return _imageWithShadow(
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image.network(
            imagePath,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator());
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.broken_image, color: Colors.grey),
          ),
        ),
      );
    }

    // Local asset
    if (isSvg) {
      return _imageWithShadow(
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: SvgPicture.asset(
            imagePath,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
          ),
        ),
      );
    }

    return _imageWithShadow(
      ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _imageWithShadow(Widget image) {
    if (boxShadow == null) return image;

    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: image,
    );
  }
}
