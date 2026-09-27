import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = true,
    this.backArrowColor,
    this.isCenter = true,
    this.titleTextColor = TColors.black,
  });

  final Widget? title;
  final Color? titleTextColor;
  final bool showBackArrow;
  final Color? backArrowColor;
  final bool? isCenter;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final appBarTitleStyle = Theme.of(context).textTheme.titleLarge;
    final backArrowIcon = Image.asset(
      TIconString.back,
      width: TSizes.iconSm,
      height: TSizes.iconSm,
      fit: BoxFit.contain,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.xs),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: isCenter,
        titleSpacing: TSizes.md,
        title: title == null
            ? null
            : DefaultTextStyle.merge(
                style: appBarTitleStyle?.copyWith(color: titleTextColor),
                child: title!,
              ),

        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: backArrowColor == null
                    ? backArrowIcon
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          backArrowColor!,
                          BlendMode.srcIn,
                        ),
                        child: backArrowIcon,
                      ),
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
