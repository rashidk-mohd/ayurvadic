import 'dart:convert';
import 'dart:developer';

import 'package:ayurvadic/core/local_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<bool> login({String? userName, String? password}) async {
    const url = "https://flutter-amr.noviindus.in/api/Login";
    
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': "test_user",
          'password': "12345678",
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.body.toString());
        Map<String, dynamic> resposneData = jsonDecode(response.body);

        LocalStorage.writeToken(resposneData["token"]);

        Map<String,dynamic> userDetails=resposneData["user_details"] as Map<String,dynamic>;
        LocalStorage.writePhne(userDetails["phone"]);
        LocalStorage.writeMail(resposneData["mail"]);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
