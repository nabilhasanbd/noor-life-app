/// Centralized app configuration.
///
/// Flip [useMockApi] to `false` once a real backend is reachable and set
/// [apiBaseUrl] to the production/staging host.
class AppConfig {
  AppConfig._();

  /// When `true`, repositories return mocked data (no network calls).
  /// Set to `false` to hit the real backend.
  static const bool useMockApi = true;

  /// Base URL of the backend API. Replace with your server host.
  static const String apiBaseUrl = 'https://api.noorlife.example.com';

  /// Request/connect/read/write timeout.
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  /// API prefix appended after the base URL.
  static const String apiPrefix = '/api/v1';
}
