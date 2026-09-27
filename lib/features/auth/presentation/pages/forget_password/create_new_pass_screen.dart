import 'package:domino/features/auth/presentation/widgets/auth_options.dart/auth_options_header.dart';
import 'package:domino/features/auth/presentation/controllers/forget_pw_controller.dart';
import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/buttons/gradient_btn.dart';
import 'package:domino/shared/widgets/components/fields/wtext_field.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/auth_text.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewPassScreen extends StatelessWidget {
  const CreateNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final controller = Get.find<ForgetPwController>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBar,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TDeviceUtils.getScreenHeight(context) * 0.06),

                AuthOptionsHeader(
                  title: TAuthText.setNewPasswordTitle,
                  subTitle: TAuthText.setNewPasswordDescription,
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                Obx(
                  () => WtextField(
                    topLabel: TAuthText.newPassword,
                    label: TAuthText.password,
                    controller: controller.password,
                    obscureText: controller.obscurePassword.value,
                    postIcon: controller.obscurePassword.value
                        ? TIconString.pwShow
                        : TIconString.pwHide,
                    onPostIconPressed: controller.togglePasswordVisibility,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                Obx(
                  () => WtextField(
                    topLabel: TAuthText.confirmPassword,
                    label: TAuthText.confirmPassword,
                    controller: controller.confirmPassword,
                    obscureText: controller.obscureConfirmPassword.value,
                    postIcon: controller.obscureConfirmPassword.value
                        ? TIconString.pwShow
                        : TIconString.pwHide,
                    onPostIconPressed:
                        controller.toggleConfirmPasswordVisibility,
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  child: WGradientButton(
                    textLabel: TAuthText.resetPassword,
                    onPressed: controller.resetPassword,
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: controller.goToSignIn,
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 18,
                      color: TColors.primary,
                    ),
                    label: Text(
                      TAuthText.backToLogIn,
                      style: theme.labelSmall?.copyWith(color: TColors.primary),
                    ),
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
