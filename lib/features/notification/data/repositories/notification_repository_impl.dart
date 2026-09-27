import 'package:domino/features/notification/domain/entities/app_notification.dart';
import 'package:domino/features/notification/domain/repositories/notification_repository.dart';

// TEMPORARY: mock data until Firebase is connected.
class NotificationRepositoryImpl implements NotificationRepository {
  @override
  List<AppNotification> fetchNotifications() {
    final now = DateTime.now();

    return [
      AppNotification(
        id: '1',
        type: NotificationType.delivery,
        title: 'Your order is on the way',
        message:
            'Your Pepperoni Pizza is out for delivery. Our rider will arrive in about 15 minutes.',
        createdAt: now.subtract(const Duration(minutes: 5)),
      ),
      AppNotification(
        id: '2',
        type: NotificationType.promo,
        title: 'Buy 1 Take 1 Fridays',
        message:
            'Get a free Margherita Pizza on every large pizza order this Friday. Use code B1T1 at checkout.',
        createdAt: now.subtract(const Duration(hours: 2)),
      ),
      AppNotification(
        id: '3',
        type: NotificationType.message,
        title: 'Message from Support',
        message:
            'Hi! We have received your concern about your last order. Tap to view our reply.',
        createdAt: now.subtract(const Duration(hours: 5)),
        isRead: true,
      ),
      AppNotification(
        id: '4',
        type: NotificationType.order,
        title: 'Order confirmed',
        message:
            'Your order of Chicken Mushroom Pizza (x2) has been confirmed and is now being prepared.',
        createdAt: now.subtract(const Duration(days: 1, hours: 1)),
      ),
      AppNotification(
        id: '5',
        type: NotificationType.delivery,
        title: 'Order delivered',
        message:
            'Your order has been delivered. Enjoy your meal and don\'t forget to rate your experience!',
        createdAt: now.subtract(const Duration(days: 1, hours: 4)),
        isRead: true,
      ),
      AppNotification(
        id: '6',
        type: NotificationType.promo,
        title: 'New dessert just dropped',
        message:
            'Try our new Choco Lava Cake, now available on the menu for only ₱99.',
        createdAt: now.subtract(const Duration(days: 4)),
        isRead: true,
      ),
    ];
  }
}
