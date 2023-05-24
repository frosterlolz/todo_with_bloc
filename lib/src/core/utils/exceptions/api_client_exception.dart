class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  final String message;
  final StackTrace? stackTrace;

  const ApiClientException({
    required this.type,
    required this.message,
    this.stackTrace,
  });
}

enum ApiClientExceptionType {
  auth,
  internet,
  server,
  other,
}
