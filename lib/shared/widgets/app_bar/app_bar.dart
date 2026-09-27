import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = true,
    this.isCenter = true,
    this.titleTextColor = TColors.black,
  });

  final String? title;
  final Color? titleTextColor;
  final bool showBackArrow;
  final bool? isCenter;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final appBarTitleStyle = Theme.of(context).textTheme.titleLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: isCenter,
        titleSpacing: TSizes.md,
        title: title != null
            ? Text(
                title!,
                style: appBarTitleStyle?.copyWith(color: titleTextColor),
              )
            : null,

        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Iconsax.arrow_left),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnPressed, icon: leadingIcon!)
            : null,
        actions: actions,
      ), // AppBar
    ); // Padding
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
