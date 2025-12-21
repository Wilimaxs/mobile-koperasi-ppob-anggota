import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure storage for sensitive data like tokens
/// Uses FlutterSecureStorage with AES encryption
class SecureStorage {
  static FlutterSecureStorage? _storage;

  static void init() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    );
  }

  static FlutterSecureStorage get _instance {
    if (_storage == null) {
      throw Exception(
        'SecureStorage not initialized. Call SecureStorage.init() first',
      );
    }
    return _storage!;
  }

  static Future<void> save(String key, dynamic value) async {
    await _instance.write(key: key, value: jsonEncode(value));
  }

  static Future<T?> read<T>(String key) async {
    final String? data = await _instance.read(key: key);
    if (data == null) return null;
    return jsonDecode(data) as T?;
  }

  static Future<void> delete(String key) async {
    await _instance.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _instance.deleteAll();
  }
}
