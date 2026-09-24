import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/pin_point.dart';
import 'package:domino/shared/widgets/images/wdisplay_image.dart';
import 'package:domino/features/auth/presentation/controllers/verify_email.controller.dart';
import 'package:domino/features/auth/presentation/widgets/email_verification/wresend_code_section.dart';
import 'package:domino/features/auth/presentation/widgets/email_verification/wverif_header.dart';
import 'package:domino/utils/constants/image/image_strings.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBar,
            child: Column(
              children: [
                // Header (Verify Your Email, Enter the 6 digit, Email)
                WVerificationHeader(email: TTexts.emailReference),
                SizedBox(height: TSizes.spaceBtwItems),

                // Image
                WDisplayImage(imagePath: TImageString.emailVerificationImg),
                SizedBox(height: TSizes.spaceBtwItems),

                // Pin point 6 digit code box
                Obx(
                  () => Column(
                    children: [
                      // OTP field
                      WOtpPinput(
                        controller: verifyEmailController.otpController,
                        enabled:
                            !verifyEmailController.lockTimer.isRunning.value,
                        onCompleted: (_) {},
                      ),

                      // Lockout message
                      if (verifyEmailController.lockTimer.isRunning.value)
                        Text(
                          'Too many attempts. Try again in ${verifyEmailController.lockTimer.secondsLeft.value}s',
                        )
                      else
                        WResendCodeSection(
                          isTimerRunning:
                              verifyEmailController.resendTimer.isRunning.value,
                          codeTimer:
                              '00:${verifyEmailController.resendTimer.secondsLeft.value.toString().padLeft(2, '0')}',
                          onResendPressed: verifyEmailController.resendCode,
                        ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      // Footer Verify Your Code
                      WGradientButton(
                        textLabel: TTexts.verifyCodeButton,
                        onPressed:
                            verifyEmailController.lockTimer.isRunning.value
                            ? null
                            : () => verifyEmailController.verifyOtp(
                                verifyEmailController.otpController.text,
                              ),
                      ),
                    ],
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
