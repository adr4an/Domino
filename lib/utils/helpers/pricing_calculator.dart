class TPricingCalculator {
  TPricingCalculator._();

  /// Calculate total for a single item: (sizePrice + toppings) x quantity.
  static double calculateItemTotal({
    required double sizePrice,
    required List<double> toppingPrices,
    required int quantity,
  }) {
    final toppingsTotal = calculateToppingsPrice(toppingPrices);
    return (sizePrice + toppingsTotal) * quantity;
  }

  /// Sum of all topping prices for one item.
  static double calculateToppingsPrice(List<double> toppingPrices) {
    return toppingPrices.fold(0.0, (sum, price) => sum + price);
  }

  /// Sum of all item totals in the cart.
  static double calculateCartSubtotal(List<double> itemTotals) {
    return itemTotals.fold(0.0, (sum, total) => sum + total);
  }

  /// Calculate the subtotal for order items using each unit price and quantity.
  static double calculateItemsTotal(List<Map<String, Object>> items) {
    final itemTotals = items.map(
      (item) => calculateItemTotal(
        sizePrice: double.parse(item['price'].toString()),
        toppingPrices: const [],
        quantity: item['quantity'] as int,
      ),
    );

    return calculateCartSubtotal(itemTotals.toList());
  }

  /// Apply a percentage discount (e.g. 10 for 10% off).
  static double applyPercentageDiscount(double amount, double percentage) {
    if (percentage <= 0) return amount;
    return amount - (amount * (percentage / 100));
  }

  /// Apply a flat discount (e.g. ₱50 promo code), never goes below 0.
  static double applyFlatDiscount(double amount, double discount) {
    final result = amount - discount;
    return result < 0 ? 0 : result;
  }

  /// Delivery fee tiers based on distance (km).
  static double calculateDeliveryFee(double distanceKm) {
    if (distanceKm <= 3) return 45.0;
    if (distanceKm <= 7) return 75.0;
    if (distanceKm <= 10) return 100.0;
    throw Exception('Delivery not available beyond 10km');
  }

  /// Final order total — no tax for now.
  static double calculateOrderTotal({
    required double subtotal,
    double discount = 0.0,
    required double deliveryFee,
  }) {
    final afterDiscount = applyFlatDiscount(subtotal, discount);
    return afterDiscount + deliveryFee;
  }
}
