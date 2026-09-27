import 'package:domino/features/history/domain/order_status.dart';

abstract class HistoryRepository {
  List<Map<String, Object>> ordersForStatus(OrderStatus status);
}
