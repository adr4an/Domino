import 'package:intl/intl.dart';

class TFormatter {
  TFormatter._();

  /// Format currency (e.g. 12.5 -> $12.50)
  static String formatCurrency(double amount, {String symbol = '\$'}) {
    return NumberFormat.currency(
      symbol: symbol,
      decimalDigits: 2,
    ).format(amount);
  }

  /// Format date (e.g. Sep 6, 2026)
  static String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  /// Format date with time (e.g. Sep 6, 2026 - 3:45 PM) — good for order history
  static String formatDateTime(DateTime date) {
    return DateFormat('MMM dd, yyyy - hh:mm a').format(date);
  }

  /// Format time only (e.g. 3:45 PM) — good for "estimated delivery" display
  static String formatTime(DateTime date) {
    return DateFormat('hh:mm a').format(date);
  }

  /// Format relative time (e.g. "5 min ago", "2 hours ago") — good for order tracking
  static String formatRelativeTime(DateTime date) {
    final difference = DateTime.now().difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else {
      return formatDate(date);
    }
  }

  /// Format phone number (e.g. 09171234567 -> +63 917 123 4567)
  static String formatPhoneNumber(String phoneNumber) {
    final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    String? local; // the 10 digits after +63

    if (digits.length == 11 && digits.startsWith('0')) {
      local = digits.substring(1); // 09171234567
    } else if (digits.length == 12 && digits.startsWith('63')) {
      local = digits.substring(2); // 639171234567
    } else if (digits.length == 10 && digits.startsWith('9')) {
      local = digits; // 9171234567
    }

    if (local == null) return phoneNumber; // unknown pattern, return as-is

    return '+63 ${local.substring(0, 3)} ${local.substring(3, 6)} ${local.substring(6)}';
  }

  /// Format order ID (e.g. 8492 -> #ORD-8492) — nice for receipts/order tracking
  static String formatOrderId(String orderId) {
    return '#ORD-${orderId.padLeft(4, '0')}';
  }

  /// Truncate long text with ellipsis (e.g. long pizza descriptions on cards)
  static String truncateText(String text, {int maxLength = 50}) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  /// Capitalize first letter of each word (e.g. "pepperoni pizza" -> "Pepperoni Pizza")
  static String capitalizeWords(String text) {
    return text
        .split(' ')
        .map(
          (word) => word.isEmpty
              ? word
              : '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}',
        )
        .join(' ');
  }
}
