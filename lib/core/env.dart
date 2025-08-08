class Env {
  static const String baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'https://rickandmortyapi.com/api',
  );

  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
  );

  static const bool enableLogging = bool.fromEnvironment(
    'ENABLE_LOGGING',
    defaultValue: true,
  );
}
