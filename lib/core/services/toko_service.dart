import 'package:shared_preferences/shared_preferences.dart';

class TokoService {
  final SharedPreferences _prefs;
  static const String _idKey = 'toko_id';
  static const String _nameKey = 'toko_name';

  TokoService(this._prefs);

  int? get tokoId => _prefs.getInt(_idKey);
  String? get tokoName => _prefs.getString(_nameKey);

  Future<void> save(int id, String name) async {
    await _prefs.setInt(_idKey, id);
    await _prefs.setString(_nameKey, name);
  }

  Future<void> updateName(String name) async {
    await _prefs.setString(_nameKey, name);
  }

  Future<void> clear() async {
    await _prefs.remove(_idKey);
    await _prefs.remove(_nameKey);
  }
}
