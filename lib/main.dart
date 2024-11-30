import 'package:ayurvadic/features/auth/controller/aut_controller.dart';
import 'package:ayurvadic/features/auth/screens/login_screen.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:ayurvadic/features/home/screen/home_screen.dart';
import 'package:ayurvadic/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController(),),
        ChangeNotifierProvider(create: (context) => HomeController(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        onGenerateRoute:RouteGenerator.generateRoute ,
      ),
    );
  }
}

