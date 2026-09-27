import 'package:domino/features/notification/domain/entities/app_notification.dart';

abstract class NotificationRepository {
  List<AppNotification> fetchNotifications();
}
