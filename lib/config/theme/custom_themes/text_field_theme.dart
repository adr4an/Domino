import 'package:domino/config/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme get lightInputDecorationTheme =>
      InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade200,
        errorMaxLines: 3,
        constraints: const BoxConstraints(minHeight: 56),
        floatingLabelBehavior: FloatingLabelBehavior.never,

        labelStyle: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),

        hintStyle: TTextTheme.lightTextTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        errorStyle: TTextTheme.lightTextTheme.bodyMedium,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1.5, color: Colors.grey),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1.5, color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 2.5, color: Colors.blue),
        ),

        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 1.5, color: Colors.red),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(width: 2.5, color: Colors.orange),
        ),
      ); // InputDecorationTheme
}
