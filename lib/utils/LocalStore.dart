import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  /// 保存数据
  static Future<bool> setLocalStorage(String key, String value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = await sharedPreferences.setString(key, value);
    return isOk;
  }

  /// 获取数据
  static Future<String> getLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String data = sharedPreferences.getString(key);
    return data;
  }

  /// 清除指定key
  static Future<bool> removeLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = await sharedPreferences.remove(key);
    return isOk;
  }

  /// 清除所有key
  static Future<bool> removeAllLocalStorage(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isOk = await sharedPreferences.clear();
    return isOk;
  }
}
