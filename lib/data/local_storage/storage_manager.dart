import 'package:ppob_koperasi_payment/data/local_storage/secure_storage.dart';
import 'package:ppob_koperasi_payment/data/local_storage/storage.dart';

class StorageManager {
  static Future<void> init() async {
    await Storage.init();
    SecureStorage.init();
  }

  static Future<void> save(
    String key,
    dynamic value, {
    bool isSecure = false,
  }) async {
    if (isSecure) {
      await SecureStorage.save(key, value);
    } else {
      await Storage.save(key, value);
    }
  }

  static Future<T?> read<T>(String key, {bool isSecure = false}) async {
    if (isSecure) {
      return await SecureStorage.read<T>(key);
    } else {
      return Storage.read<T>(key);
    }
  }

  static Future<void> delete(String key, {bool isSecure = false}) async {
    if (isSecure) {
      await SecureStorage.delete(key);
    } else {
      await Storage.delete(key);
    }
  }

  static Future<void> deleteAll() async {
    await Storage.deleteAll();
    await SecureStorage.deleteAll();
  }
}
