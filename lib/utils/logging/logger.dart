import 'package:logger/logger.dart';

class TLoggerHelper {
  TLoggerHelper._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // number of stack trace lines to show
      errorMethodCount: 5, // stack trace lines for errors
      lineLength: 90,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
  );

  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }

  static void warning(dynamic message) {
    _logger.w(message);
  }

  static void error(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  static void trace(dynamic message) {
    _logger.t(message);
  }

  static void wtf(dynamic message) {
    _logger.f(message);
  }
}
