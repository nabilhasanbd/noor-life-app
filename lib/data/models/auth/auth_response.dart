import '../user_model.dart';

/// Successful login/register response (token + authenticated user).
class AuthResponse {
  final String accessToken;
  final String? refreshToken;
  final UserModel user;

  const AuthResponse({
    required this.accessToken,
    this.refreshToken,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] is Map<String, dynamic> ? json['data'] : json;
    return AuthResponse(
      accessToken: '${data['accessToken'] ?? data['token'] ?? ''}',
      refreshToken: data['refreshToken'] as String?,
      user: UserModel.fromJson(
        data['user'] is Map<String, dynamic> ? data['user'] : <String, dynamic>{},
      ),
    );
  }
}
