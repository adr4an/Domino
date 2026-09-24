import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TLoaders {
  TLoaders._();

  static void showSnackBar(String message) {
    Get.snackbar('Notice', message, snackPosition: SnackPosition.BOTTOM);
  }

  static void successSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: TColors.primary,
      colorText: TColors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  static void errorSnackBar({required String title, String message = ''}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: TColors.error,
      colorText: TColors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  static void showAlert(String title, String message) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      onConfirm: () => Get.back(),
      textConfirm: 'OK',
    );
  }
}
