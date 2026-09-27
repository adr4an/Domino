import 'package:flutter/material.dart';

enum NotificationType { order, delivery, promo, message }

// adds extra behavior to the enums
extension NotificationTypeX on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.order:
        return Icons.receipt_long_outlined;
      case NotificationType.delivery:
        return Icons.delivery_dining_outlined;
      case NotificationType.promo:
        return Icons.local_offer_outlined;
      case NotificationType.message:
        return Icons.mail_outline_rounded;
    }
  }
}

class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.createdAt,
    this.isRead = false,
  });

  final String id;
  final NotificationType type;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;

  AppNotification copyWith({bool? isRead}) {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      message: message,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}
