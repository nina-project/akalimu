import 'package:akalimu/data/models/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static final LocalPreferences _instance = LocalPreferences._default();
  factory LocalPreferences() => _instance;

  LocalPreferences._default();

  late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  int get runTimes {
    return _sharedPreferences.getInt('runTimes') ?? 0;
  }

  get userToken {
    return _sharedPreferences.getString('userToken') ?? "";
  }

  get userPassword {
    return _sharedPreferences.getString('userPassword') ?? "";
  }

  Client? get userData {
    String? userJsonString = _sharedPreferences.getString('userData');
    if (userJsonString == null) return null;
    return Client.fromJson(userJsonString);
  }

  Future<bool> setRunTimes(int value) {
    return _sharedPreferences.setInt('runTimes', value);
  }

  Future<bool> setUserToken(String value) {
    return _sharedPreferences.setString('userToken', value);
  }

  Future<bool> setUserPassword(String value) {
    return _sharedPreferences.setString('userPassword', value);
  }

  Future<bool> setUserData(Client? user) async {
    if (user == null) {
      return _sharedPreferences.remove('userData');
    }
    return _sharedPreferences.setString('userData', user.toJson());
  }
}
