import 'package:domino/features/notification/domain/notification_filter.dart';
import 'package:domino/features/notification/presentation/controller/notification_controller.dart';
import 'package:domino/features/notification/presentation/widgets/notification_tile.dart';
import 'package:domino/shared/widgets/components/empty_state.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/images/icon_string.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/constants/texts/notification_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WNotificationListView extends StatelessWidget {
  const WNotificationListView({super.key, required this.filter});

  final NotificationFilter filter;

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.instance;
    final theme = Theme.of(context).textTheme;

    return Obx(() {
      // Get the grouped notifications based on the selected filter
      final groups = controller.groupedFor(filter);

      // Display empty state for the selected filter
      if (groups.isEmpty) {
        final isUnread = filter == NotificationFilter.unread;

        return WEmptyState(
          image: TIconString.noSpam,
          visualSize: 72,
          title: isUnread
              ? TNotificationText.emptyUnreadTitle
              : TNotificationText.emptyAllTitle,
          message: isUnread
              ? TNotificationText.emptyUnreadMessage
              : TNotificationText.emptyAllMessage,
        );
      }

      return ListView(
        padding: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
        children: [
          for (final entry in groups.entries) ...[
            // Section Header (Today, Yesterday, Earlier)
            Padding(
              padding: const EdgeInsets.only(top: TSizes.sm),
              child: Text(
                entry.key,
                style: theme.labelMedium?.copyWith(
                  color: TColors.darkGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Notification Tiles
            for (var index = 0; index < entry.value.length; index++) ...[
              WNotificationTile(
                notification: entry.value[index],
                onTap: () => controller.markAsRead(entry.value[index].id),
              ),
              if (index < entry.value.length - 1)
                const Divider(height: 1, indent: 60, color: TColors.grey300),
            ],
            const SizedBox(height: TSizes.sm),
          ],
        ],
      );
    });
  }
}
