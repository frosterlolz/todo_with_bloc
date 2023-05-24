class AuthenticationException implements Exception {
  final AuthenticationErrorType type;
  final String message;

  const AuthenticationException({
    required this.type,
    required this.message,
  });
}

enum AuthenticationErrorType { auth, update, deleteAccount, other }
