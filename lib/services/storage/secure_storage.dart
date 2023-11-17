import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _secureStorage = const FlutterSecureStorage();
  final _keyToken = 'userToken';

  Future<void> persistUserToken(String token) async {

    await _secureStorage.write(
      key: _keyToken,
      value: token,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<String?> getActiveUserToken() async {
    String? userToken = await _secureStorage.read(
      key: _keyToken,
      aOptions: _getAndroidOptions(),
    );

    return userToken;
  }

  // this method is used to set the encrypted sharedPref to true.
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> logoutUser() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }
}
