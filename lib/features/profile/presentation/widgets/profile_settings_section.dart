import 'package:domino/features/chat/presentation/bindings/support_chat_binding.dart';
import 'package:domino/features/chat/presentation/pages/chat_screen.dart';
import 'package:domino/features/profile/presentation/controller/profile_controller.dart';
import 'package:domino/features/profile/presentation/widgets/setting_section.dart';
import 'package:domino/features/profile/presentation/widgets/setting_title.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/profile_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileSettingsSections extends StatelessWidget {
  const ProfileSettingsSections({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Column(
      children: [
        SettingsSection(
          title: TProfileStrings.basicInformation,
          children: [
            WSettingsTile(
              label: TProfileStrings.username,
              iconPath: TIconString.profile,
              onTap: controller.editUsername,
            ),
            WSettingsTile(
              label: TProfileStrings.phoneNumber,
              iconPath: TIconString.profileCall,
              onTap: controller.editPhone,
            ),
          ],
        ),
        SettingsSection(
          title: TProfileStrings.account,
          children: [
            WSettingsTile(
              label: TProfileStrings.email,
              iconPath: TIconString.email,
              onTap: controller.editEmail,
            ),
            WSettingsTile(
              label: TProfileStrings.passwordSecurity,
              iconPath: TIconString.security,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.connectedAccounts,
              iconPath: TIconString.link,
              onTap: () {},
            ),
          ],
        ),
        SettingsSection(
          title: TProfileStrings.personalization,
          children: [
            WSettingsTile(
              label: TProfileStrings.theme,
              iconPath: TIconString.lightTheme,
              value: TProfileStrings.light,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.notifications,
              iconPath: TIconString.notif,
              onTap: () {},
            ),
          ],
        ),
        SettingsSection(
          title: TProfileStrings.supportHelp,
          children: [
            WSettingsTile(
              label: TProfileStrings.helpCenterFaq,
              iconPath: TIconString.faq,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.contactSupport,
              iconPath: TIconString.chat,
              onTap: () => Get.to(
                () => const SupportChatScreen(),
                binding: SupportChatBinding(),
              ),
            ),

            WSettingsTile(
              label: TProfileStrings.logout,
              iconPath: TIconString.logout,
              onTap: () => controller.goToAuth(),
            ),
          ],
        ),
      ],
    );
  }
}
