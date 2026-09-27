import 'package:domino/features/profile/presentation/widgets/setting_section.dart';
import 'package:domino/features/profile/presentation/widgets/setting_title.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/texts/profile_string.dart';
import 'package:flutter/material.dart';

class ProfileSettingsSections extends StatelessWidget {
  const ProfileSettingsSections({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsSection(
          title: TProfileStrings.basicInformation,
          children: [
            WSettingsTile(
              label: TProfileStrings.username,
              iconPath: TIconString.profile,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.phoneNumber,
              iconPath: TIconString.profileCall,
              onTap: () {},
            ),
          ],
        ),
        SettingsSection(
          title: TProfileStrings.account,
          children: [
            WSettingsTile(
              label: TProfileStrings.email,
              iconPath: TIconString.email,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.passwordSecurity,
              iconPath: TIconString.profileLock,
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
              iconPath: TIconString.helpFAQ,
              onTap: () {},
            ),
            WSettingsTile(
              label: TProfileStrings.contactSupport,
              iconPath: TIconString.customerService,
              onTap: () {},
            ),

            WSettingsTile(
              label: TProfileStrings.logout,
              iconPath: TIconString.logout,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
