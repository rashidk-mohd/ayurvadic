import 'package:ayurvadic/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool isLoading=false;
  AuthRepository auth = AuthRepository();
  Future<void> login({String? userName, String? password}) async {
    isLoading=true;
    auth.login(password: password, userName: userName);
     isLoading=false;
     notifyListeners();
  }
}
