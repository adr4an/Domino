import 'package:domino/features/auth/presentation/pages/forget_pw_screen.dart';
import 'package:domino/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  // Field Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool emailHasText = false.obs;
  final RxBool isEmailValid = false.obs;

  final RxBool obscurePassword = true.obs;
  final RxBool rememberMe = false.obs;
  final RxBool hasEmail = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      emailHasText.value = emailController.text.isNotEmpty;
      isEmailValid.value = GetUtils.isEmail(emailController.text);
    });
  }

  void goToForgetPassword() {
    Get.to(() => ForgetPasswordScreen());
  }

  void goToHome() {
    Get.offAll(() => const NavigationMenu());
  }

  // Check if the field is not empty
  void updateEmail(String value) {
    hasEmail.value = value.trim().isNotEmpty;
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
