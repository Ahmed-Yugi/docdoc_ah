import 'package:shared_preferences/shared_preferences.dart';

class GenericHelper {

  static SharedPreferences? _saver;


  static Future<void> init() async {
    _saver = await SharedPreferences.getInstance();
  }


  static Future<bool> saveData({
    required String key,
    required String value,
  }) async {
    return await _saver!.setString(key, value);
  }


  static String? getData(String key) {
    return _saver!.getString(key);
  }


  static Future<bool> removeData(String key) async {
    return await _saver!.remove(key);
  }


  static Future<bool> clearAll() async {
    return await _saver!.clear();
  }
}