import 'package:domino/shared/widgets/components/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class WCurvedWidget extends StatelessWidget {
  const WCurvedWidget({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: widget);
  }
}
