import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          PathConstsnts.spalshimage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
