import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// Regular storage for non-sensitive data
// Uses SharedPreferences for persistent storage
class Storage {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get _instance {
    if (_prefs == null) throw Exception('Storage not initialized');
    return _prefs!;
  }

  // Write data to storage
  static Future<bool> save(String key, dynamic value) {
    return _instance.setString(key, jsonEncode(value));
  }

  // Read data from storage
  static T? read<T>(String key) {
    final String? data = _instance.getString(key);
    if (data == null) return null;
    return jsonDecode(data) as T?;
  }

  // Delete specific key from storage
  static Future<bool> delete(String key) => _instance.remove(key);

  // Delete all data from storage
  static Future<bool> deleteAll() => _instance.clear();
}
