import 'package:domino/features/notification/domain/entities/app_notification.dart';
import 'package:domino/shared/widgets/components/custom_shapes/container/rounded_container.dart';
import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/sizes.dart';
import 'package:domino/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';

class WNotificationTile extends StatelessWidget {
  const WNotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  final AppNotification notification;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final isUnread = !notification.isRead;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Type Icon
            WRoundedContainer(
              width: 44,
              height: 44,
              radius: TSizes.cardRadiusMd,
              backgroundColor: TColors.textOrange.withValues(alpha: 0.12),
              child: Icon(
                notification.type.icon,
                size: TSizes.iconMd,
                color: TColors.textOrange,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            // Title + Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          notification.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.bodyMedium?.copyWith(
                            color: TColors.black,
                            fontWeight: isUnread
                                ? FontWeight.w700
                                : FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.sm),
                      Text(
                        TFormatter.formatRelativeTime(notification.createdAt),
                        style: theme.labelSmall?.copyWith(
                          color: TColors.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.bodySmall?.copyWith(
                      color: isUnread ? TColors.darkerGrey : TColors.darkGrey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            // Unread Dot
            if (isUnread) ...[
              const SizedBox(width: TSizes.sm),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: TColors.textOrange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
