import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  late SharedPreferences sharedPreferences;

  //! Initial Shared Prefernces
  cacheInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Set Key Method
  Future setdata({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
  }

  //! Get String Key
  getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Get Bool Key
  dynamic getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  //! Get Int Key
  getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }
}
