import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_with_bloc/src/core/domain/persistence/storage/token_storage/token_storage.dart';

class TokenStorageImpl implements TokenStorage {
  static const String tokenKey = 'token_key';
  static const String loginKey = 'login_key';

  late final FlutterSecureStorage? _secureStorage;

  TokenStorageImpl() {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<String?> getLogin() async {
    final login = await _secureStorage?.read(key: loginKey);

    return login;
  }

  @override
  Future<String?> getToken() async {
    final token = await _secureStorage?.read(key: tokenKey);

    return token;
  }

  @override
  Future<void> saveLogin(String login) async {
    await _secureStorage?.write(key: loginKey, value: login);
  }

  @override
  Future<void> saveToken(String token) async {
    await _secureStorage?.write(key: tokenKey, value: token);
  }

  @override
  Future<void> removeLogin() async {
    await _secureStorage?.delete(key: loginKey);
  }

  @override
  Future<void> removeToken() async {
    await _secureStorage?.delete(key: tokenKey);
  }
}
