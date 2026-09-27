import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/constants/colors.dart' show TColors;

class WtextField extends StatelessWidget {
  const WtextField({
    super.key,
    required this.label,
    this.topLabel,
    this.controller,
    this.preIcon,
    this.onPreIconPressed,
    this.postIcon,
    this.obscureText = false,
    this.onPostIconPressed,
    this.onChanged,
    this.onSubmitted,
    this.textColor = TColors.darkerGrey,
    this.fillColor = TColors.white,
    this.borderColor = TColors.grey300,
    this.borderWidth = 1,
    this.focusedBorderWidth = 1.5,
    this.showClearButton = false,
    this.hintColor,
    this.minLines,
    this.maxLines = 1,
    this.keyboardType,
    this.inputFormatters,
    this.autofocus = false,
    this.errorText,
    this.showRequiredMark = true,
    this.readOnly = false,
  });

  final String label;
  final String? topLabel;
  final TextEditingController? controller;
  final dynamic preIcon;
  final VoidCallback? onPreIconPressed;
  final dynamic postIcon;
  final bool obscureText;
  final VoidCallback? onPostIconPressed;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool showClearButton;
  final Color textColor;
  final Color? fillColor;
  final Color borderColor;
  final double borderWidth;
  final double focusedBorderWidth;
  final Color? hintColor;
  final int? minLines;
  final int maxLines;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final String? errorText;
  final bool showRequiredMark;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final bool showBuiltInClear =
        showClearButton && postIcon == null && !readOnly;
    final theme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (topLabel != null) ...[
          Text(
            showRequiredMark && !topLabel!.endsWith('*')
                ? '$topLabel*'
                : topLabel!,
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
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
            autofocus: autofocus,
            readOnly: readOnly,
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            obscureText: obscureText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            minLines: minLines,
            maxLines: obscureText ? 1 : maxLines,
            style: theme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
            cursorColor: TColors.primary,

            decoration: InputDecoration(
              hintText: label,
              errorText: errorText,
              errorStyle: theme.bodySmall?.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
              hintStyle: theme.bodyMedium?.copyWith(
                color: hintColor ?? textColor,
              ),
              labelStyle: theme.bodyMedium?.copyWith(color: textColor),
              constraints: const BoxConstraints(minHeight: 56),
              filled: fillColor != null,
              fillColor: fillColor,

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
                borderSide: BorderSide(color: borderColor, width: borderWidth),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusSm),
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
        ),
      ],
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
