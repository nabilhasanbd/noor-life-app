import 'package:dio/dio.dart';

import '../../core/config/app_config.dart';
import '../../core/network/api_client.dart';
import '../../core/network/api_endpoints.dart';
import '../../core/network/api_exceptions.dart';
import '../models/auth/auth_response.dart';
import '../models/auth/login_request.dart';
import '../models/user_model.dart';
/// Contract every auth repository implementation must satisfy.
abstract class AuthRepository {
  Future<AuthResponse> login(LoginRequest request);
  Future<AuthResponse> register({required String name, required String email, required String password});
  Future<UserModel> currentUser();
  Future<void> logout();
}

/// Repository that resolves to the real or mock implementation based on
/// [AppConfig.useMockApi].
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<AuthResponse> login(LoginRequest request) {
    if (AppConfig.useMockApi) return _MockAuthApi().login(request);
    return _RemoteAuthApi().login(request);
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) {
    if (AppConfig.useMockApi) {
      return _MockAuthApi().register(name: name, email: email, password: password);
    }
    return _RemoteAuthApi().register(name: name, email: email, password: password);
  }

  @override
  Future<UserModel> currentUser() {
    if (AppConfig.useMockApi) return _MockAuthApi().currentUser();
    return _RemoteAuthApi().currentUser();
  }

  @override
  Future<void> logout() {
    if (AppConfig.useMockApi) return _MockAuthApi().logout();
    return _RemoteAuthApi().logout();
  }
}

/// Real backend implementation backed by [ApiClient] (Dio).
class _RemoteAuthApi implements AuthRepository {
  final ApiClient _client = ApiClient.instance;

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    try {
      final res = await _client.post<Map<String, dynamic>>(
        ApiEndpoints.login,
        body: request.toJson(),
      );
      return AuthResponse.fromJson(res.data!);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiClient.mapDioError(e);
    } catch (_) {
      throw const UnknownException();
    }
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client.post<Map<String, dynamic>>(
        ApiEndpoints.register,
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );
      return AuthResponse.fromJson(res.data!);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiClient.mapDioError(e);
    } catch (_) {
      throw const UnknownException();
    }
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      final res = await _client.get<Map<String, dynamic>>(ApiEndpoints.me);
      return UserModel.fromJson(res.data!);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiClient.mapDioError(e);
    } catch (_) {
      throw const UnknownException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _client.post<void>(ApiEndpoints.logout);
    } on ApiException {
      rethrow;
    } on DioException catch (e) {
      throw ApiClient.mapDioError(e);
    } catch (_) {
      throw const UnknownException();
    }
  }
}

/// Mock implementation used until the backend is ready.
/// Simulates network latency and rejects obviously invalid credentials.
class _MockAuthApi implements AuthRepository {
  static const Duration _latency = Duration(milliseconds: 800);

  @override
  Future<AuthResponse> login(LoginRequest request) async {
    await Future.delayed(_latency);
    if (request.email.isEmpty || request.password.length < 4) {
      throw const ApiRequestException(
        'Invalid email or password',
        statusCode: 401,
      );
    }
    return AuthResponse(
      accessToken: 'mock-access-token',
      refreshToken: 'mock-refresh-token',
      user: UserModel(
        id: '1',
        name: 'Noor User',
        email: request.email,
      ),
    );
  }

  @override
  Future<AuthResponse> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(_latency);
    return AuthResponse(
      accessToken: 'mock-access-token',
      refreshToken: 'mock-refresh-token',
      user: UserModel(id: '1', name: name, email: email),
    );
  }

  @override
  Future<UserModel> currentUser() async {
    await Future.delayed(_latency);
    return const UserModel(id: '1', name: 'Noor User', email: 'user@noorlife.app');
  }

  @override
  Future<void> logout() async {
    await Future.delayed(_latency);
  }
}
