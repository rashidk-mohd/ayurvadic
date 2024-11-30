import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/core/local_storage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
  }
  getLoginStatus()async{
final token=await LocalStorage.readToken();
if(token.isNotEmpty){
Navigator.of(context).pushNamed(Routes.home);
}
  }
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
