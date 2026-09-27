import 'package:domino/utils/constants/colors.dart';
import 'package:domino/utils/constants/texts/order_history_text.dart';
import 'package:flutter/material.dart';

enum OrderStatus { pending, completed, cancelled }

// adds extra behavior to the enums
extension OrderStatusX on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return OrderHistoryTexts.pending;
      case OrderStatus.completed:
        return OrderHistoryTexts.completed;
      case OrderStatus.cancelled:
        return OrderHistoryTexts.cancelled;
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return TColors.warning;
      case OrderStatus.completed:
        return TColors.primary;
      case OrderStatus.cancelled:
        return TColors.error;
    }
  }
}
