import 'package:domino/utils/constants/colors.dart';
import 'package:flutter/material.dart';

enum OrderStatus { pending, completed, cancelled }

// adds extra behavior to the enums
extension OrderStatusX on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.completed:
        return 'Completed';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return TColors.warning;
      case OrderStatus.completed:
        return TColors.info;
      case OrderStatus.cancelled:
        return TColors.error;
    }
  }
}
