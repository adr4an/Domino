import 'package:domino/features/home/presentation/controller/home_controller.dart';
import 'package:domino/shared/widgets/components/products/counter_icon.dart';
import 'package:domino/shared/widgets/images/wdisplay_icon.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class WHomeAppBar extends StatelessWidget {
  const WHomeAppBar({super.key, required this.controller});

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      floating: false,
      snap: false,
      automaticallyImplyLeading: false,
      leadingWidth: kToolbarHeight + TSizes.md,
      leading: Padding(
        padding: const EdgeInsets.only(left: TSizes.xs),
        child: IconButton(
          onPressed: () {},
          icon: WDisplayIcon(iconPath: TIconString.menu),
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: TSizes.md),
      actions: [
        WCounterIcon(
          icon: TIconString.notif,
          label: '3',
          iconColor: TColors.black,
          badgeColor: TColors.error,
          badgeRight: 4,
          onTap: controller.goToNotfication,
        ),
        WCounterIcon(
          icon: TIconString.cart,
          label: '8',
          iconColor: TColors.black,
          badgeColor: TColors.error,
        ),
      ],
    );
  }
}
