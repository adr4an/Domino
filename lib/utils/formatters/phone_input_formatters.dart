import 'package:domino/utils/formatters/no_leading_zero_formatter.dart';
import 'package:flutter/services.dart';

class TPhoneInputFormatters {
  TPhoneInputFormatters._();

  /// Local number after the +63 prefix: digits only, no leading 0, max 10.
  static List<TextInputFormatter> get local => [
    FilteringTextInputFormatter.digitsOnly,
    NoLeadingZeroFormatter(),
    LengthLimitingTextInputFormatter(10),
  ];
}
