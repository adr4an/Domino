import 'package:domino/features/auth/presentation/pages/auth_options_screen.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  // final _box = GetStorage();

  void goToHome() {
    Get.offAll(() => const AuthOptionsScreen());
  }
}
