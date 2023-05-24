/// Persistent storage for config settings.
// ignore_for_file: prefer-match-file-name
abstract class IConfigSettingsStorage {
  /// Returns proxy url.
  Future<String?> getProxyUrl();

  /// Save proxy url [proxy].
  Future<void> setProxyUrl({required String proxy});
}
