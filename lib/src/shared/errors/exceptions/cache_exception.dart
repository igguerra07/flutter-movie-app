class CacheException implements Exception {
  final String key;
  final dynamic error;
  final String? message;
  final StackTrace? stackTrace;

  CacheException({
    required this.key,
    this.error,
    this.message,
    this.stackTrace,
  });

  @override
  String toString() => "CacheException[$key]: $message\n$stackTrace";
}
