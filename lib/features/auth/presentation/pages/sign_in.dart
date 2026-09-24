import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/features/auth/presentation/controllers/signin_controller.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wlabel_divider.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wsignin_footer.dart';
import 'package:domino/features/auth/presentation/widgets/sign_in/wsignin_form.dart';
import 'package:domino/shared/widgets/components/default/wauth_header.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithoutAppBar,
            child: Column(
              children: [
                SizedBox(height: TSizes.spaceBtwItems),

                // Header (Logo, Title, Subtitle)
                WAuthHeader(
                  headTitle: TTexts.welcome,
                  headSubTititle: TTexts.pleaseEnterYourDetails,
                ),
                SizedBox(height: TSizes.spaceBtwItems),

                // Form (Email, Password, Remember Me - Forget Password, Sign Button - Create Account)
                WsigninForm(controller: controller),
                SizedBox(height: TSizes.spaceBtwSections),

                // Divider
                WLabeledDivider(label: TTexts.orSignInWith),
                SizedBox(height: TSizes.spaceBtwSections),

                // Footer (Or Sign In With, Social Media Buttons [Google, Facebook])
                WSignInFooter(textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
