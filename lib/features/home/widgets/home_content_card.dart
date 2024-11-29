import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:ayurvadic/features/home/widgets/content_icon_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeContentCard extends StatelessWidget {
  const HomeContentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: screenWidth(context) * 0.9,
        height: screenHeigth(context) * 0.2,
        decoration: BoxDecoration(
          color: const Color(0xffF1F1F1),
          border: Border.all(
            width: 0,
            color: ColorConstents.textcolor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: ColorConstents.textcolor.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "1.  Vikram Singh",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorConstents.textcolor),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 22, top: 5),
                child: Text(
                  "Couple Combo Package (Rejuven...",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: ColorConstents.buttonColor),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContentIconWidget(
                      path: PathConstsnts.calender,
                      text: "31/2/2024",
                    ),
                    ContentIconWidget(
                      path: PathConstsnts.person,
                      text: "Jithesh",
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: ColorConstents.colorGrey.withOpacity(0.2),
              ),
             const Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "View Booking details",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: ColorConstents.textcolor),
                    ),
                    const Icon(CupertinoIcons.chevron_forward),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
