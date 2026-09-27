class OrderHistoryTexts {
  OrderHistoryTexts._();

  // Screen title and order status labels.
  static const String orderHistory = 'Order History';
  static const String pending = 'Pending';
  static const String completed = 'Completed';
  static const String cancelled = 'Cancelled';

  // Order card labels.
  static const String orderTotal = 'Order total';
  static const String currencySymbol = '₱';

  // Empty-state, item count and item price labels.
  static String noOrdersForStatus(String status) =>
      'No ${status.toLowerCase()} orders yet';
  static String itemCount(int count) => count == 1 ? '1 item' : '$count items';
  static String unitPriceLabel(String price, int quantity) =>
      '$currencySymbol$price × $quantity';
}
