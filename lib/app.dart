import 'package:domino/config/theme/theme.dart';
import 'package:domino/features/auth/presentation/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      home: const OnboardingScreen(),
    );
  }
}
