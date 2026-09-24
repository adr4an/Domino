import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class WOtpPinput extends StatelessWidget {
  const WOtpPinput({
    super.key,
    required this.onCompleted,
    this.controller,
    this.enabled = true,
  });

  final ValueChanged<String> onCompleted;
  final TextEditingController? controller;
  final bool enabled;

  PinTheme _pinTheme({Color? borderColor, Color? fillColor}) {
    return PinTheme(
      height: 56,
      width: 48,
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? TColors.grey, width: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      enabled: enabled,
      controller: controller,
      defaultPinTheme: _pinTheme(),
      focusedPinTheme: _pinTheme(borderColor: TColors.primary),
      submittedPinTheme: _pinTheme(
        borderColor: TColors.primary,
        fillColor: TColors.primary.withValues(alpha: 0.1),
      ),
      onCompleted: onCompleted,
    );
  }
}
