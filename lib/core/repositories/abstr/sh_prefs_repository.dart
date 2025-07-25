abstract class ShPrefRepository {
  Future<String> getString(String key);

  Future<void> setString(String key, String value);

  Future<List<String>?> getStringList(String key);

  Future<void> setStringList(String key, List<String> value);

  Future<void> remove(String key);
}
