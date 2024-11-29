import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/common/common_textfield.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/features/auth/widgets/app_logo_widget.dart';
import 'package:ayurvadic/features/auth/widgets/privacy_policy.dart';
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
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: Text(
              "Login or register to book",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstents.textcolor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 8),
            child: Text(
              "your appointments",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorConstents.textcolor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Email",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstents.textcolor),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: CustomTextField(
              title: "Enter your email",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Password",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorConstents.textcolor2),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: CustomTextField(
              title: "Enter your password",
            ),
          ),
          Padding(
            padding:const  EdgeInsets.only(left: 8, right: 8,top:  30),
            child: ButtonWidget(
              title: "Login",
              onPressed: () {},
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
