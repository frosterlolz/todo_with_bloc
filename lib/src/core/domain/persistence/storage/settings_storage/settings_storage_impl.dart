import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_with_bloc/src/core/domain/persistence/storage/settings_storage/settings_storage.dart';

class SettingsStorageImpl implements SettingsStorage {
  static const String addressIdKey = 'selected_address_id';

  late final FlutterSecureStorage? _secureStorage;

  SettingsStorageImpl() {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<int?> getSelectedAddressId() async {
    final addressId = await _secureStorage?.read(key: addressIdKey);

    return int.tryParse(addressId ?? '');
  }

  @override
  Future<void> setSelectedAddressId(int addressId) async {
    await _secureStorage?.write(key: addressIdKey, value: '$addressId');
  }
}
