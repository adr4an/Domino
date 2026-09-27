import 'package:domino/utils/constants/texts/notification_text.dart';

enum NotificationFilter { all, unread }

// adds extra behavior to the enums
extension NotificationFilterX on NotificationFilter {
  String get label {
    switch (this) {
      case NotificationFilter.all:
        return TNotificationText.all;
      case NotificationFilter.unread:
        return TNotificationText.unread;
    }
  }
}
