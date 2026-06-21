/// Application-level exception types so the UI can react to failures
/// without depending on the underlying HTTP library.
sealed class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// Thrown when the server returns a non-2xx response.
class ApiRequestException extends ApiException {
  final int statusCode;
  final dynamic data;

  const ApiRequestException(
    super.message, {
    required this.statusCode,
    this.data,
  });
}

/// Thrown when the request fails to reach the server (timeout, DNS, etc.).
class NetworkException extends ApiException {
  const NetworkException([super.message = 'No internet connection']);
}

/// Thrown when authentication is required or credentials are invalid.
class UnauthorizedException extends ApiException {
  const UnauthorizedException([super.message = 'Authentication required']);
}

/// Generic unexpected failure.
class UnknownException extends ApiException {
  const UnknownException([super.message = 'Something went wrong']);
}
