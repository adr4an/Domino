import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TFullScreenLoader {
  TFullScreenLoader._();

  static void openLoadingDialog(String text, String animation) {
    Get.dialog(
      barrierDismissible: false,
      PopScope(
        canPop: false, // prevents back-button dismissal while loading
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(animation, width: 320, height: 320),
              const SizedBox(height: 20),
              if (text.isNotEmpty)
                Text(
                  text,
                  style: Theme.of(Get.context!).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
