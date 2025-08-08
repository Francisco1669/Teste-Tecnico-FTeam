import 'dart:developer' as developer;

class Logger {
  static void log(String message, {String? name, Object? error}) {
    developer.log(
      message,
      name: name ?? 'App',
      error: error,
    );
  }

  static void info(String message) {
    log('[INFO] $message');
  }

  static void warning(String message) {
    log('[WARNING] $message');
  }

  static void error(String message, [Object? error]) {
    log('[ERROR] $message', error: error);
  }
}
