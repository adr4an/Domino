class TValidator {
  TValidator._();

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasDigit = value.contains(RegExp(r'\d'));

    if (!hasUppercase || !hasDigit) {
      return 'Password must contain at least one uppercase letter and one number';
    }

    return null;
  }

  static String? validateConfirmPassword(
    String? value,
    String originalPassword,
  ) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != originalPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    final digits = value.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 11 && digits.startsWith('09')) {
      return null; // valid PH mobile number
    } else if (digits.length == 10) {
      return null; // valid generic 10-digit fallback
    }

    return 'Please enter a valid phone number';
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }

    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }

    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Delivery address is required';
    }

    if (value.length < 10) {
      return 'Please enter a complete address';
    }

    return null;
  }

  static String? validatePromoCode(String? value) {
    if (value == null || value.isEmpty) {
      return null; // optional field, empty is fine
    }

    final promoRegExp = RegExp(r'^[a-zA-Z0-9]+$');
    if (!promoRegExp.hasMatch(value)) {
      return 'Promo code can only contain letters and numbers';
    }

    return null;
  }
}
