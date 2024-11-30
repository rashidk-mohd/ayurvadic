import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/features/auth/controller/aut_controller.dart';

import 'package:ayurvadic/features/auth/widgets/app_logo_widget.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppLogoWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Text(
              "Login or register to book",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstents.textcolor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Text(
              "Your appointments",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstents.textcolor),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 30),
            child: CustomTextField(
              controller: userNameController,
              header: "Username",
              title: "Enter your username",
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 50),
            child: CustomTextField(
              controller: passwordController,
              header: "Password",
              title: "Enter your password",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
            child:  Consumer<AuthController>(
              builder: (context, value, child) => ButtonWidget(
                  isLoading: value.isLoading,
                  title: "Login",
                  onPressed: () {
                    value.login(context,
                        userName: userNameController.text.trim(),
                        password: passwordController.text.trim());
                  },
                  titleColor: Colors.white,
                  fontSize: 17,
                  buttonColor: ColorConstents.buttonColor,
                
              ),
            ),
          ),
          // const PrivacyPolicy()
        ],
      ),
    );
  }
}
