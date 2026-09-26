import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/default/wauth_header.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/features/auth/presentation/controllers/forget_pw_controller.dart';
import 'package:domino/features/auth/presentation/widgets/auth_options.dart/resend_timer.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wauth_footer.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:domino/utils/constants/texts/text_strings.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPwController());

    return Scaffold(
      appBar: WAppBar(showBackArrow: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithoutAppBar,
            child: Column(
              children: [
                SizedBox(height: TDeviceUtils.getScreenHeight(context) * 0.07),

                // Img
                WDisplayImage(
                  imagePath: TIconString.password,
                  width: 90,
                  height: 90,
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                // Header
                WAuthHeader(
                  headTitle: TAuthText.forgetPasswordTitle,
                  headSubTititle: TAuthText.forgetPasswordDescription,
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                // Email Field
                Obx(
                  () => WtextField(
                    label: TAuthText.email,
                    controller: controller.emailController,
                    showClearButton: controller.hasEmail.value,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                Obx(
                  () => Column(
                    children: [
                      if (controller.resendTimer.isRunning.value)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: WResendTimerText(
                            label: TAuthText.resendCodeIn,
                            timerText: controller.resendTimer.secondsLeft.value,
                          ),
                        ),

                      WGradientButton(
                        textLabel: TAuthText.sendResetLink,
                        onPressed: controller.resendTimer.isRunning.value
                            ? null
                            : controller.sendResetLink,
                      ),
                    ],
                  ),
                ), // Send OTP btn
                // Remember PW + Sign in
                WAuthFooter(
                  label: TAuthText.rememberYourPassword,
                  btnLabel: TTexts.signIn,
                  onTap: () {
                    controller.goToSignIn();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
