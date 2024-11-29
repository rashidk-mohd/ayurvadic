import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class AuthRepository {
  Future login({String? userName, String? password}) async {
    const url = "https://flutter-amr.noviindus.in/api/Login";
   try {
    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': userName ?? '',
        'password': password ?? '',
      },
    );

    if (response.statusCode == 200) {
      print("Login successful: ${response.body}");
    } else {
      print("Login failed with status: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  } catch (e) {
    print("An error occurred: $e");
  }
   
  }
}
