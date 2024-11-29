import 'package:ayurvadic/core/app_responsive.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final bool isLoading;
  final Color? titleColor;
  final Color borderColor;
  final double fontSize;

  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonColor = const Color(0xff1C75BC),
    this.isLoading = false,
    this.titleColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.fontSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        side: BorderSide(
          color: borderColor,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: buttonColor,
        minimumSize: Size(screenWidth(context), 54),
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              title,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: onPressed != null ? titleColor : null,
              ),
            ),
    );
  }
}
