import 'package:dio/dio.dart';

import '../config/app_config.dart';
import 'api_exceptions.dart';

/// Single, shared [Dio] HTTP client for the app.
///
/// Configure base URL/timeouts in [AppConfig]. Repositories translate
/// [DioException]s to [ApiException]s via [mapDioError], so the rest of the
/// app never imports `dio`.
class ApiClient {
  ApiClient._() : _dio = _create();

  static final ApiClient instance = ApiClient._();

  final Dio _dio;

  static Dio _create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.apiBaseUrl,
        connectTimeout: AppConfig.connectTimeout,
        receiveTimeout: AppConfig.receiveTimeout,
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Attach bearer token here once an auth store exists, e.g.:
          // options.headers['Authorization'] = 'Bearer $token';
          handler.next(options);
        },
      ),
    );

    return dio;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get<T>(path, queryParameters: queryParameters);

  Future<Response<T>> post<T>(
    String path, {
    Object? body,
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.post<T>(path, data: body, queryParameters: queryParameters);

  Future<Response<T>> put<T>(
    String path, {
    Object? body,
  }) =>
      _dio.put<T>(path, data: body);

  Future<Response<T>> delete<T>(String path) => _dio.delete<T>(path);

  /// Translate a [DioException] into an app-level [ApiException].
  static ApiException mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkException();
      case DioExceptionType.badResponse:
        return _mapBadResponse(e);
      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return UnknownException(e.message ?? 'Something went wrong');
    }
  }

  static ApiException _mapBadResponse(DioException e) {
    final status = e.response?.statusCode ?? 0;
    final message = _extractMessage(e);
    if (status == 401 || status == 403) {
      return UnauthorizedException(message);
    }
    return ApiRequestException(
      message,
      statusCode: status,
      data: e.response?.data,
    );
  }

  static String _extractMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data['message'] is String) {
      return data['message'] as String;
    }
    return e.message ?? 'Request failed';
  }
}
