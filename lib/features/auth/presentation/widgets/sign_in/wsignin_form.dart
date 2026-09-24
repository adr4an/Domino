import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/features/auth/presentation/controllers/signin_controller.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wcheckbox_action.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/utils/constants/image/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class WsigninForm extends StatelessWidget {
  const WsigninForm({super.key, required this.controller});

  final SignInController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Email
          Obx(
            () => WtextField(
              label: TTexts.email,
              preIcon: TIconString.email,
              controller: controller.emailController,
              onChanged: controller.updateEmail,
              showClearButton: controller.emailHasText.value,
            ),
          ),
          SizedBox(height: TSizes.sm),

          // Password
          Obx(
            () => WtextField(
              controller: controller.passwordController,
              label: TTexts.password,
              preIcon: TIconString.pw,
              postIcon: controller.obscurePassword.value
                  ? TIconString.pwHide
                  : TIconString.pwShow,
              obscureText: controller.obscurePassword.value,
              onPostIconPressed: controller.togglePasswordVisibility,
            ),
          ),

          // Remember Me + Forget Password
          Obx(
            () => WCheckboxWithAction(
              value: controller.rememberMe.value,
              onChanged: controller.toggleRememberMe,
              label: TTexts.rememberMe,
              actionLabel: TTexts.forgetPassword,
              onActionPressed: () => controller.goToForgetPassword(),
            ),
          ),
          SizedBox(height: TSizes.spaceBtwItems),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: WGradientButton(
              onPressed: () => controller.goToHome(),
              textLabel: TTexts.signIn,
            ),
          ),
          SizedBox(height: TSizes.sm),
        ],
      ),
    );
  }
}
