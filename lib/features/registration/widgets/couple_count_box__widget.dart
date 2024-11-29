import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:flutter/material.dart';

class CoupleCountBoxwidget extends StatelessWidget {
  const CoupleCountBoxwidget(
      {super.key, required this.count, required this.gender});
  final String? gender;
  final int? count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          gender!,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstents.buttonColor),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          width: screenWidth(context) * 0.117,
          height: screenHeigth(context) * 0.032,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ColorConstents.buttonColor, width: 1)),
          child: Center(child: Text("$count")),
        )
      ],
    );
  }
}
