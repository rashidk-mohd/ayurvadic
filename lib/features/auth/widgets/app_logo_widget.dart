import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          PathConstsnts.loginBgimg,
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              PathConstsnts.ayurvadicLogo,
            ),
          ),
        ),
      ],
    );
  }
}