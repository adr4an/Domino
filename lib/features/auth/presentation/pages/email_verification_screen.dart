import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/pin_point.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/features/auth/presentation/controllers/verify_email.controller.dart';
import 'package:domino/features/auth/presentation/widgets/email_verification/wresend_code_section.dart';
import 'package:domino/features/auth/presentation/widgets/email_verification/wverif_header.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final verifyEmailController = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: WAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBar,
            child: Column(
              children: [
                SizedBox(height: TDeviceUtils.getScreenHeight(context) * 0.1),

                WDisplayImage(
                  imagePath: TIconString.message,
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                // Header (Verify Your Email, Enter the 6 digit, Email)
                WVerificationHeader(email: TAuthText.emailReference),
                SizedBox(height: TSizes.spaceBtwSections),

                // Pin point 6 digit code box
                Obx(
                  () => Column(
                    children: [
                      WOtpPinput(
                        controller: verifyEmailController.otpController,
                        enabled:
                            !verifyEmailController.lockTimer.isRunning.value,
                        onCompleted: (_) {},
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      // Resend section — swaps between countdown and locked message
                      if (verifyEmailController.lockTimer.isRunning.value)
                        Text(
                          '${TAuthText.tooManyAttemps} ${verifyEmailController.lockTimer.secondsLeft.value}s',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: TColors.error),
                        )
                      else
                        WResendCodeSection(
                          isTimerRunning:
                              verifyEmailController.resendTimer.isRunning.value,
                          codeTimer:
                              '00:${verifyEmailController.resendTimer.secondsLeft.value.toString().padLeft(2, '0')}', // ✅ updated
                          onResendPressed: verifyEmailController.resendCode,
                        ),
                      SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),

                // Footer Verify Your Code
                WGradientButton(
                  textLabel: TAuthText.verifyCodeButton,
                  onPressed: verifyEmailController.lockTimer.isRunning.value
                      ? null
                      : () => verifyEmailController.verifyOtp(
                          verifyEmailController.otpController.text,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
