import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:movie_app/src/shared/errors/errors.dart';

import '../value_key_storage.dart';

class SharedPrefsCache implements ValueKeyStorage {
  late final SharedPreferences _sharedPrefs;

  SharedPrefsCache({
    required SharedPreferences sharedPreferences,
  }) {
    _sharedPrefs = sharedPreferences;
  }

  @override
  Future<Map<String, dynamic>?> get({
    required String key,
  }) async {
    try {
      final data = _sharedPrefs.getString(key);
      if (data == null) return null;
      final value = jsonDecode(data);
      return value;
    } catch (e, s) {
      throw CacheException(
        key: key,
        error: e,
        stackTrace: s,
        message: "Error get resource",
      );
    }
  }

  @override
  Future<void> save({
    required String key,
    required dynamic data,
  }) async {
    try {
      final value = jsonEncode(data);
      _sharedPrefs.setString(key, value);
    } catch (e, s) {
      throw CacheException(
        key: key,
        error: e,
        stackTrace: s,
        message: "Error on save resource",
      );
    }
  }

  @override
  Future<void> delete({
    required String key,
  }) async {
    try {
      await _sharedPrefs.remove(key);
    } catch (e, s) {
      throw CacheException(
        key: key,
        error: e,
        stackTrace: s,
        message: "Error on delete resource",
      );
    }
  }

  @override
  @override
  Future<void> clear() async => await _sharedPrefs.clear();
}
