import 'dart:developer';

import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/auth/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool isLoading = false;
  AuthRepository auth = AuthRepository();
  Future<void> login(BuildContext context,
      {String? userName, String? password}) async {
    isLoading = true;
    notifyListeners();
    final result = await auth.login(password: password, userName: userName);

    if (result) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Utils.showErrorSnackbar();
    }
    isLoading = false;
    notifyListeners();
  }
}
