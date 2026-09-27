import 'package:domino/features/profile/presentation/widgets/profile_settings_section.dart';
import 'package:domino/features/profile/presentation/widgets/user_profile.dart';
import 'package:domino/shared/styles/spacing_style.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/primary_header_container.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.grey200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile
            WPrimaryHeaderContainer(
              child: Column(
                children: [
                  WAppBar(
                    title: 'My Account',
                    titleTextColor: TColors.white,
                    isCenter: false,
                    showBackArrow: false,
                  ),

                  WUserProfileTile(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            // Setting Section
            Padding(
              padding: TSpacingStyle.paddingWithAppBar,
              child: ProfileSettingsSections(),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
