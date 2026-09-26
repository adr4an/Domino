import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/features/auth/presentation/controllers/signup_controller.dart';
import 'package:domino/features/auth/presentation/pages/email_verification_screen.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wcheckbox_action.dart';
import 'package:domino/features/auth/presentation/widgets/sign_up/wsignup_terms.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:domino/utils/constants/texts/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class WSignupForm extends StatelessWidget {
  const WSignupForm({super.key, required this.controller});

  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Full Name
          WtextField(label: TAuthText.fullName, preIcon: TIconString.user),
          SizedBox(height: TSizes.sm),

          // Email
          WtextField(label: TAuthText.email, preIcon: TIconString.email),
          SizedBox(height: TSizes.sm),

          // Phone Number
          WtextField(label: TAuthText.phoneNo, preIcon: TIconString.phone),
          SizedBox(height: TSizes.sm),

          // Row [Password, Confirm Password]
          Row(
            children: [
              Obx(
                () => Expanded(
                  child: WtextField(
                    label: TAuthText.password,
                    postIcon: controller.obscurePassword.value
                        ? TIconString.pwShow
                        : TIconString.pwHide,
                    obscureText: controller.obscurePassword.value,
                    onPostIconPressed: controller.togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(width: TSizes.sm),

              Obx(
                () => Expanded(
                  child: WtextField(
                    label: TAuthText.confirmPassword,
                    postIcon: controller.obscureConfirmPassword.value
                        ? TIconString.pwShow
                        : TIconString.pwHide,
                    obscureText: controller.obscureConfirmPassword.value,
                    onPostIconPressed:
                        controller.toggleConfirmPasswordVisibility,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: TSizes.sm),

          // Terms & Conditions
          Obx(
            () => WCheckboxWithAction(
              value: controller.isAgreeToTerms.value,
              onChanged: controller.toggleTerms,
              richLabel: WTermsAndAgreement(
                prefixText: TAuthText.agreementPrefix,
                termsText: TAuthText.termsOfService,
                conjunctionText: TAuthText.agreementAnd,
                privacyText: TAuthText.agreementPrivacyPolicy,
              ),
              onActionPressed: () {},
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: WGradientButton(
              textLabel: TTexts.signUp,
              onPressed: () => Get.to(() => const EmailVerificationScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
