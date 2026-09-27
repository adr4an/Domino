import 'package:domino/features/notification/presentation/controller/notification_controller.dart';
import 'package:domino/features/notification/presentation/widgets/notification_list_view.dart';
import 'package:domino/features/notification/presentation/widgets/notification_tab_selector.dart';
import 'package:domino/shared/widgets/app_bar/app_bar.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/notification_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.instance;

    return Scaffold(
      backgroundColor: TColors.grey200,
      appBar: WAppBar(
        title: const Text(TNotificationText.notifications),
        actions: [
          Obx(
            () => IconButton(
              tooltip: TNotificationText.markAllAsRead,
              onPressed: controller.unreadCount > 0
                  ? controller.markAllAsRead
                  : null,
              icon: const Icon(Icons.done_all_rounded),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: TSizes.spaceBtwItems),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.md),
            child: WNotificationTabSelector(),
          ),
          const SizedBox(height: TSizes.sm),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
              child: Obx(
                () => WNotificationListView(
                  filter: controller.filters[controller.selectedIndex.value],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
