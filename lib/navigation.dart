import 'dart:ui' show ImageFilter;

import 'package:domino/features/favorite/presentation/pages/favorite_screen.dart';
import 'package:domino/features/history/presentation/pages/history_screen.dart';
import 'package:domino/features/home/presentation/controller/home_controller.dart';
import 'package:domino/features/home/presentation/pages/home_screen.dart';
import 'package:domino/features/profile/presentation/controller/profile_controller.dart';
import 'package:domino/features/profile/presentation/pages/profile_screen.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return DefaultTabController(
      length: controller.screens.length,
      child: Scaffold(
        extendBody: true,
        body: BottomBar(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: controller.screens,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Material(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(24),
                  clipBehavior: Clip.antiAlias,
                  child: TabBar(
                    indicatorColor: TColors.primary,
                    dividerColor: Colors.transparent,
                    splashBorderRadius: BorderRadius.circular(24),
                    tabs: [
                      Tab(
                        icon: WDisplayIcon(
                          iconPath: TIconString.home,
                          size: TSizes.iconSm,
                        ),
                      ),
                      Tab(
                        icon: WDisplayIcon(
                          iconPath: TIconString.history,
                          size: TSizes.iconSm,
                        ),
                      ),
                      Tab(
                        icon: WDisplayIcon(
                          iconPath: TIconString.cart,
                          size: TSizes.iconSm,
                        ),
                      ),
                      Tab(
                        icon: WDisplayIcon(
                          iconPath: TIconString.profile,
                          size: TSizes.iconSm,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  NavigationController() {
    Get.put(HomeController());
    Get.put(ProfileController());
  }

  final screens = [
    HomeScreen(),
    HistoryScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];
}
