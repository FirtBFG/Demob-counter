import 'package:provider_app1/core/repositories/abstr/sh_prefs_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShPrefRepositoryImpl implements ShPrefRepository {
  final SharedPreferences prefs;
  ShPrefRepositoryImpl(this.prefs);

  @override
  Future<String> getString(String key) {
    return Future.value(prefs.getString(key));
  }

  @override
  Future<List<String>> getStringList(String key) {
    return Future.value(prefs.getStringList(key));
  }

  @override
  Future<void> setString(String key, String value) {
    return Future.value(prefs.setString(key, value));
  }

  @override
  Future<void> setStringList(String key, List<String> value) {
    return Future.value(prefs.setStringList(key, value));
  }

  @override
  Future<void> remove(String key) {
    return Future.value(prefs.remove(key));
  }
}
