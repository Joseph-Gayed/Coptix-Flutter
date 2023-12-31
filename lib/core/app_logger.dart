import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../shared/utils/app_configurations.dart';

class AppLogger {
  final Logger _logger = Logger(
      printer: PrettyPrinter(
          methodCount: 0, // Number of method calls to be displayed
          errorMethodCount: 8, // Number of method calls
          lineLength: 320, // Width of the output
          colors: true, // Colorful log messages
          printEmojis: true, // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ));
  final isReleaseLoggingEnabled = enableAppLoggingInReleaseMode;

  void t(dynamic message) {
    if (isReleaseLoggingEnabled || !kReleaseMode) {
      _logger.t(message);
    }
  }

  void d(dynamic message) {
    if (isReleaseLoggingEnabled || !kReleaseMode) {
      _logger.d(message);
    }
  }

  void i(dynamic message) {
    if (isReleaseLoggingEnabled || !kReleaseMode) {
      _logger.i(message);
    }
  }

  void w(dynamic message) {
    var loggerNoStack = Logger(
      printer: PrettyPrinter(methodCount: 0),
    );

    if (isReleaseLoggingEnabled || !kReleaseMode) {
      loggerNoStack.w(message);
    }
  }

  void e(dynamic message) {
    if (isReleaseLoggingEnabled || !kReleaseMode) {
      _logger.e(message);
    }
  }

  void wtf(dynamic message) {
    if (isReleaseLoggingEnabled || !kReleaseMode) {
      _logger.f(message);
    }
  }
}
