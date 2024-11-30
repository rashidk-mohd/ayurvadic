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
static  void writeMail(String? token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("MAIL", token ?? "");
  }

 static Future<String> readMail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("MAIL");
    return token ?? "";
  }
static  void writePhne(String? token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("MAIL", token ?? "");
  }

 static Future<String> readPhone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("MAIL");
    return token ?? "";
  }
}
