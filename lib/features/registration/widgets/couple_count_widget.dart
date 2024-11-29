import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:ayurvadic/features/registration/widgets/couple_count_box__widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoupleCountWidget extends StatelessWidget {
  const CoupleCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Treatment",
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ColorConstents.textcolor),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: screenWidth(context) * 0.933,
          height: screenHeigth(context) * 0.160,
          decoration: BoxDecoration(
              color: const Color(0xffF1F1F1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Couple combo package",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorConstents.textcolor),
                    ),
                    Image.asset(PathConstsnts.close),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CoupleCountBoxwidget(
                    count: 0,
                    gender: "Male",
                  ),
                  CoupleCountBoxwidget(
                    count: 0,
                    gender: "Female",
                  ),
                  Icon(
                    Icons.edit,
                    color: ColorConstents.buttonColor,
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
