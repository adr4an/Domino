import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/components/default/wauth_header.dart';
import 'package:domino/features/auth/presentation/controllers/signup_controller.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wlabel_divider.dart';
import 'package:domino/features/auth/presentation/widgets/sign_up/wsignup_footer.dart';
import 'package:domino/features/auth/presentation/widgets/sign_up/wsignup_form.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithoutAppBar,
            child: Column(
              children: [
                WAuthHeader(
                  textTheme: Theme.of(context).textTheme,
                  headTitle: TTexts.getStarted,
                  headSubTititle: TTexts.signupSubTitle,
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                // Form Full Name, Email, Phone Number, Row[PW, Confirm PW], Sign Up Button)
                WSignupForm(controller: controller),
                SizedBox(height: TSizes.spaceBtwItems),

                // Divider
                WLabeledDivider(label: TTexts.orSignUpWith),
                SizedBox(height: TSizes.spaceBtwItems),

                // Footer: Row [Google, Facebook]
                WSignUpFooter(),

                // Row [Already have an account?, Sign In]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
