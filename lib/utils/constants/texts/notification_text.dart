class TNotificationText {
  TNotificationText._();

  // Screen title and filter tab labels.
  static const String notifications = 'Notifications';
  static const String all = 'All';
  static const String unread = 'Unread';
  static const String markAllAsRead = 'Mark all as read';

  // Section headers.
  static const String today = 'Today';
  static const String yesterday = 'Yesterday';
  static const String earlier = 'Earlier';

  // Empty-state labels.
  static const String emptyAllTitle = 'No notifications yet';
  static const String emptyAllMessage =
      'Order updates and promos will show up here.';
  static const String emptyUnreadTitle = "You're all caught up";
  static const String emptyUnreadMessage = 'You have no unread notifications.';
}
