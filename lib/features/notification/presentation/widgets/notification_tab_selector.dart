import 'package:domino/features/notification/domain/notification_filter.dart';
import 'package:domino/features/notification/presentation/controller/notification_controller.dart';
import 'package:domino/shared/widgets/components/tabs/segmented_tab_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WNotificationTabSelector extends StatelessWidget {
  const WNotificationTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.instance;

    return Obx(() {
      final unreadCount = controller.unreadCount;

      return WSegmentedTabSelector(
        selectedIndex: controller.selectedIndex.value,
        onTabSelected: controller.changeTab,
        labels: controller.filters.map((filter) {
          // Show the unread count beside the Unread tab, e.g. "Unread (3)".
          if (filter == NotificationFilter.unread && unreadCount > 0) {
            return '${filter.label} ($unreadCount)';
          }
          return filter.label;
        }).toList(),
      );
    });
  }
}
