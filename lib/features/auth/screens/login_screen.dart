import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/features/auth/widgets/app_logo_widget.dart';
import 'package:ayurvadic/features/auth/widgets/privacy_policy.dart';
import 'package:ayurvadic/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstents.textcolor),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 30),
            child: CustomTextField(
              title: "Enter your email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstents.textcolor2),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 50),
            child: CustomTextField(
              title: "Enter your password",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
            child: ButtonWidget(
              title: "Login",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.home);
              },
              titleColor: Colors.white,
              fontSize: 17,
              buttonColor: ColorConstents.buttonColor,
            ),
          ),
          // const PrivacyPolicy()
        ],
      ),
    );
  }
}
