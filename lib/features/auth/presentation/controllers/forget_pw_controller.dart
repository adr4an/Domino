import 'package:domino/features/auth/presentation/pages/sign_in.dart';
import 'package:domino/utils/constants/images/image_strings.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:domino/utils/helpers/popups/full_screen_loaders.dart';
import 'package:domino/utils/helpers/popups/loaders.dart';
import 'package:domino/utils/helpers/timer/count_down_timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPwController extends GetxController {
  static ForgetPwController get instance => Get.find();

  // ============ Email Field ============
  final emailController = TextEditingController();
  final RxBool hasEmail = false.obs;
  final RxBool isEmailValid = false.obs;

  void updateEmail(String value) {
    hasEmail.value = value.trim().isNotEmpty;
    isEmailValid.value = GetUtils.isEmail(value.trim());
  }

  // ============ Resend Cooldown ============
  static const int _cooldownSeconds = 30;
  final resendTimer = TCountdownTimer(storageKey: 'resetLinkSentAt');

  // ============ Send Reset Link ============
  Future<void> sendResetLink() async {
    if (!isEmailValid.value) {
      TLoaders.errorSnackBar(
        title: TAuthText.invalidCode,
        message: TAuthText.enterValidEMail,
      );
      return;
    }

    if (resendTimer.isRunning.value) return;

    try {
      TFullScreenLoader.openLoadingDialog('', TImageString.loadingAnimation);

      await Future.delayed(const Duration(seconds: 3));

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: TAuthText.checkYourEmail,
        message: TAuthText.resetLinkSentMessage,
      );

      resendTimer.start(_cooldownSeconds);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: TAuthText.somethingWentWrong,
        message: TAuthText.pleaseTryAgainLater,
      );
    }
  }

  // ============ Navigation ============
  void goToSignIn() {
    Get.offAll(() => const SignInScreen());
  }

  // ============ Lifecycle ============
  @override
  void onInit() {
    super.onInit();
    resendTimer.resumeIfActive();
    emailController.addListener(() => updateEmail(emailController.text));
  }

  @override
  void onClose() {
    resendTimer.dispose();
    emailController.dispose();
    super.onClose();
  }
}
