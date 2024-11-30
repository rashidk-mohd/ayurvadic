import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
static  void writeToken(String? token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("TOKEN", token ?? "");
  }

 static Future<String> readToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("TOKEN");
    return token ?? "";
  }
}
