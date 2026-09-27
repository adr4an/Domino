import 'package:domino/features/notification/domain/entities/app_notification.dart';
import 'package:domino/features/notification/domain/notification_filter.dart';
import 'package:domino/features/notification/domain/repositories/notification_repository.dart';
import 'package:domino/utils/constants/texts/notification_text.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationController({required this.repository});

  static NotificationController get instance => Get.find();

  final NotificationRepository repository;
  final notifications = <AppNotification>[].obs;
  final selectedIndex = 0.obs;

  // collect all the values of enums
  final filters = NotificationFilter.values;

  // Returns the number of unread notifications.
  int get unreadCount => notifications.where((n) => !n.isRead).length;

  @override
  void onInit() {
    super.onInit();
    notifications.assignAll(repository.fetchNotifications());
  }

  List<AppNotification> notificationsFor(NotificationFilter filter) {
    return switch (filter) {
      NotificationFilter.all => notifications,
      NotificationFilter.unread =>
        notifications.where((n) => !n.isRead).toList(),
    };
  }

  // Groups notifications under Today / Yesterday / Earlier, keeping order.
  Map<String, List<AppNotification>> groupedFor(NotificationFilter filter) {
    final groups = <String, List<AppNotification>>{};
    for (final notification in notificationsFor(filter)) {
      groups
          .putIfAbsent(_sectionFor(notification.createdAt), () => [])
          .add(notification);
    }
    return groups;
  }

  String _sectionFor(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(date.year, date.month, date.day);
    final daysAgo = today.difference(day).inDays;

    if (daysAgo == 0) return TNotificationText.today;
    if (daysAgo == 1) return TNotificationText.yesterday;
    return TNotificationText.earlier;
  }

  // Updates the currently selected tab index.
  void changeTab(int index) => selectedIndex.value = index;

  void markAsRead(String id) {
    final index = notifications.indexWhere((n) => n.id == id);
    if (index == -1 || notifications[index].isRead) return;

    notifications[index] = notifications[index].copyWith(isRead: true);
  }

  void markAllAsRead() {
    if (unreadCount == 0) return;
    // toList() builds the copies first; assignAll clears the list before adding,
    // so a lazy map over the same list would end up empty.
    notifications.assignAll(
      notifications.map((n) => n.copyWith(isRead: true)).toList(),
    );
  }
}
