import 'dart:async';
import 'package:domino/features/auth/presentation/pages/sign_in.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:domino/utils/helpers/popups/full_screen_loaders.dart';
import 'package:domino/utils/helpers/popups/loaders.dart';
import 'package:domino/utils/helpers/timer/count_down_timer.dart';
import 'package:domino/utils/local_storage/storage_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final _storage = TLocalStorage();

  // ============ OTP Verification ============
  final otpController = TextEditingController();
  final String _referenceOtp = "123456";

  void verifyOtp(String enteredOtp) async {
    if (lockTimer.isRunning.value) return;

    // Ensure the field is not empty
    if (enteredOtp.length < 6) {
      TLoaders.errorSnackBar(
        title: TTexts.invalidCode,
        message: 'Please enter all 6 digits.',
      );
      return;
    }

    TFullScreenLoader.openLoadingDialog('', TImageString.loadingAnimation);

    // simulate/await your real API call here
    await Future.delayed(const Duration(seconds: 1));
    TFullScreenLoader.stopLoading();

    if (enteredOtp == _referenceOtp) {
      TLoaders.successSnackBar(
        title: TTexts.success,
        message: TTexts.emailGotVerified,
      );

      _resetAttempts();

      Future.delayed(const Duration(milliseconds: 800), () {
        Get.offAll(() => const SignInScreen());
      });
    } else {
      otpController.clear();
      _registerFailedAttempt();
    }
  }

  // ============ Attempt Lockout ============
  static const int _maxAttempts = 3;
  static const int _lockoutSeconds = 5;
  static const String _attemptsKey = 'otpAttempts';

  final RxInt attemptsLeft = _maxAttempts.obs;
  final lockTimer = TCountdownTimer(storageKey: 'otpLockedUntil');

  void _registerFailedAttempt() {
    attemptsLeft.value -= 1;
    _storage.saveData(_attemptsKey, attemptsLeft.value);

    if (attemptsLeft.value <= 0) {
      TLoaders.errorSnackBar(
        title: TTexts.tooManyAttemps,
        message: TTexts.pleaseWait,
      );
      lockTimer.start(_lockoutSeconds);
    } else {
      TLoaders.errorSnackBar(
        title: TTexts.invalidCode,
        message:
            '${TTexts.incorrectCode} ${attemptsLeft.value} ${TTexts.attemptsLeft}',
      );
    }
  }

  void _resetAttempts() {
    attemptsLeft.value = _maxAttempts;
    _storage.removeData(_attemptsKey);
    lockTimer.cancel();
  }

  // ============ Resend Cooldown ============
  static const int _cooldownSeconds = 30;
  final resendTimer = TCountdownTimer(storageKey: 'otpSentAt');

  Future<void> resendCode() async {
    try {
      resendTimer.start(_cooldownSeconds);
    } catch (e) {
      // TODO: show an error snackbar/toast if resend fails
    }
  }

  void startInitialCooldown() {
    resendTimer.start(_cooldownSeconds);
  }

  // ============ Lifecycle ============
  @override
  void onInit() {
    super.onInit();
    resendTimer.resumeIfActive();
    lockTimer.resumeIfActive();

    // resume attempt count on init too
    attemptsLeft.value = _storage.readData<int>(_attemptsKey) ?? _maxAttempts;
  }

  @override
  void onClose() {
    resendTimer.dispose();
    lockTimer.dispose();
    otpController.dispose();
    super.onClose();
  }
}
