import 'dart:ui';

import 'package:flutter/material.dart';

class TGlassBlur extends StatelessWidget {
  const TGlassBlur({
    super.key,
    required this.child,
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
    this.sigma = 10,
  });

  final Widget child;
  final BorderRadiusGeometry borderRadius;
  final double sigma;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: child,
      ),
    );
  }
}
