import 'package:flutter/material.dart';

class TGradients {
  TGradients._();

  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF34B56A), Color(0xFF12753B)],
  );

  static const LinearGradient home = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3D6FB4), Color(0xFF4E8FC4)],
  );
}
