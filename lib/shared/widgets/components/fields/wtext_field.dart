import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart' show TColors;

class WtextField extends StatelessWidget {
  const WtextField({
    super.key,
    required this.label,
    this.controller,
    this.preIcon,
    this.onPreIconPressed,
    this.postIcon,
    this.obscureText = false,
    this.onPostIconPressed,
    this.onChanged,
    this.textColor = TColors.darkerGrey,
    this.fillColor = TColors.white,
    this.borderColor = TColors.grey300,
    this.borderWidth = 1,
    this.focusedBorderWidth = 1.5,
    this.showClearButton = false,
  });

  final String label;
  final TextEditingController? controller;
  final dynamic preIcon;
  final VoidCallback? onPreIconPressed;
  final dynamic postIcon;
  final bool obscureText;
  final VoidCallback? onPostIconPressed;
  final ValueChanged<String>? onChanged;
  final bool showClearButton;
  final Color textColor;
  final Color? fillColor;
  final Color borderColor;
  final double borderWidth;
  final double focusedBorderWidth;

  @override
  Widget build(BuildContext context) {
    final bool showBuiltInClear = showClearButton && postIcon == null;
    final theme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        style: theme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
        cursorColor: TColors.primary,

        decoration: InputDecoration(
          hintText: label,
          hintStyle: theme.bodyMedium?.copyWith(color: textColor),
          labelStyle: theme.bodyMedium?.copyWith(color: textColor),
          constraints: const BoxConstraints(minHeight: 56),
          filled: fillColor != null,
          fillColor: fillColor,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(color: borderColor, width: borderWidth),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide(
              color: borderColor,
              width: focusedBorderWidth,
            ),
          ),

          prefixIcon: preIcon == null
              ? null
              : onPreIconPressed == null
              ? Padding(
                  padding: const EdgeInsets.all(12),
                  child: _buildIcon(preIcon),
                )
              : IconButton(
                  onPressed: onPreIconPressed,
                  icon: _buildIcon(preIcon),
                ),

          suffixIcon: showBuiltInClear
              ? IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: () {
                    controller?.clear();
                    onChanged?.call('');
                  },
                )
              : (postIcon == null
                    ? null
                    : IconButton(
                        onPressed: onPostIconPressed,
                        icon: _buildIcon(postIcon),
                      )),
        ),
      ),
    );
  }

  Widget _buildIcon(dynamic icon) {
    if (icon is Widget) {
      return icon;
    }

    if (icon is IconData) {
      return Icon(icon, size: 22, color: Colors.black54);
    }

    if (icon is String) {
      return WDisplayIcon(iconPath: icon, width: 22, height: 22);
    }

    return const SizedBox.shrink();
  }
}
