// lib/utils/helpers/popups/dialogs.dart
import 'package:domino/features/chat/presentation/widgets/confirm_dialog.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/texts/chat_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WDialogs {
  WDialogs._();

  /// Returns true if the user confirmed, false if cancelled or dismissed.
  static Future<bool> confirm({
    required String title,
    required String message,
    String confirmText = TChatText.confirm,
    String cancelText = TChatText.cancel,
    IconData? icon,
    Color? iconColor,
    Color? confirmColor,
    Color? cancelColor,
    bool isDestructive = false,
    bool barrierDismissible = true,
  }) async {
    final result = await Get.dialog<bool>(
      WConfirmDialog(
        title: title,
        message: message,
        confirmText: confirmText,
        cancelText: cancelText,
        icon: icon,
        iconColor: iconColor ?? TColors.darkGrey,
        confirmColor:
            confirmColor ?? (isDestructive ? TColors.black : TColors.primary),
        cancelColor: cancelColor ?? TColors.darkGrey,
        onConfirm: () => Get.back(result: true),
        onCancel: () => Get.back(result: false),
      ),
      barrierDismissible: barrierDismissible,
    );

    return result ?? false;
  }
}
