import 'package:ayurvadic/contants/color_constents.dart';
import 'package:flutter/material.dart';

class ContentIconWidget extends StatelessWidget {
  const ContentIconWidget({
    super.key,
    required this.path,
    required this.text
  });
final String? path;
final String? text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(path!),
       const SizedBox(width: 5,),
        Text(
          "$text",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: ColorConstents.textcolor.withOpacity(0.5)),
        )
      ],
    );
  }
}
