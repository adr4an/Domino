import 'package:domino/features/history/domain/order_status.dart';
import 'package:domino/features/history/domain/repositories/history_repository.dart';
import 'package:domino/utils/constants/images/image_strings.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  static const List<Map<String, Object>> _pendingOrders = [
    {
      'purchaseDate': 'Sep 24, 2026',
      'items': [
        {
          'imageUrl': TImageString.pizzaProdcut2,
          'name': 'Pepperoni Pizza',
          'price': '279.00',
          'quantity': 1,
        },
      ],
    },
    {
      'purchaseDate': 'Sep 22, 2026',
      'items': [
        {
          'imageUrl': TImageString.pizzaProdcut1,
          'name': 'Chicken Mushroom Pizza',
          'price': '299.00',
          'quantity': 2,
        },
        {
          'imageUrl': TImageString.pizzaProduct3,
          'name': 'Margherita Pizza',
          'price': '249.00',
          'quantity': 1,
        },
      ],
    },
  ];

  static const List<Map<String, Object>> _completedOrders = [
    {
      'purchaseDate': 'Sep 20, 2026',
      'items': [
        {
          'imageUrl': TImageString.pizzaProduct3,
          'name': 'Margherita Pizza',
          'price': '249.00',
          'quantity': 1,
        },
      ],
    },
  ];

  static const List<Map<String, Object>> _cancelledOrders = [];

  @override
  List<Map<String, Object>> ordersForStatus(OrderStatus status) {
    return switch (status) {
      OrderStatus.pending => _pendingOrders,
      OrderStatus.completed => _completedOrders,
      OrderStatus.cancelled => _cancelledOrders,
    };
  }
}
