abstract class ValueKeyStorage {
  Future<Map<String, dynamic>?> get({
    required String key,
  });

  Future<void> save({
    required String key,
    required dynamic data,
  });

  Future<void> delete({
    required String key,
  });

  Future<void> clear();
}
