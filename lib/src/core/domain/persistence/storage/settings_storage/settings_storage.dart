abstract class SettingsStorage {
  Future<void> setSelectedAddressId(int id);
  Future<int?> getSelectedAddressId();
  // Future<String?> getToken();
  // Future<String?> getLogin();
  // Future<void> saveToken(String token);
  // Future<void> saveLogin(String login);
  // Future<void> removeToken();
  // Future<void> removeLogin();
}
