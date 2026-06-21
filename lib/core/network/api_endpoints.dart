import '../config/app_config.dart';

/// Centralized API endpoint paths.
///
/// Combine with [AppConfig.apiBaseUrl] to form full URLs, e.g.
/// `AppConfig.apiBaseUrl + ApiEndpoints.login`.
class ApiEndpoints {
  ApiEndpoints._();

  static const String login = '${AppConfig.apiPrefix}/auth/login';
  static const String register = '${AppConfig.apiPrefix}/auth/register';
  static const String logout = '${AppConfig.apiPrefix}/auth/logout';
  static const String me = '${AppConfig.apiPrefix}/auth/me';
  static const String googleLogin = '${AppConfig.apiPrefix}/auth/google';
}
