import 'package:elearning_app/src/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _preference;
  Future<StorageService> init() async {
    _preference = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preference.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _preference.setString(key, value);
  }
  
 // first Device Opened.....
  getDeviceFirstOpen() {
    return _preference.getBool(AppConstants.storageDeviceOpenFirstTime) ??
        false;
  }

  bool getIsLoggedIn() {
    return _preference.getString(AppConstants.storageUserTokenKey) == null ? false : true;
  }
}
