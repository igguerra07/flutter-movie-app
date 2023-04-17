enum ApiErrorType {
  connection,
  response,
  other,
}

class ApiError implements Exception {
  final dynamic error;
  final String? message;
  final int? statusCode;
  final ApiErrorType type;
  final StackTrace? stackTrace;

  ApiError({
    this.error,
    this.message,
    this.stackTrace,
    this.statusCode,
    this.type = ApiErrorType.other,
  });

  @override
  String toString() => "ApiError[${type.name}]: $message\n$stackTrace";
}
