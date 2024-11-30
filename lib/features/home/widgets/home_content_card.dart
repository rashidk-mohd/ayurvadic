import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/core/app_responsive.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/widgets/content_icon_widget.dart';
import 'package:ayurvadic/features/home/widgets/pdf.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeContentCard extends StatelessWidget {
  const HomeContentCard(
      {super.key,
      required this.index,
      required this.name,
      required this.date,
      required this.time,
      required this.user,
      required this.adress,
      required this.branch,
      required this.email,
      required this.gst,
      required this.tretmentName,
      required this.patient,
      this.phone});
  final int? index;
  final String? name;
  final String? tretmentName;
  final String? date;
  final String? time;
  final String? user;
  final String? adress;
  final String? branch;
  final String? gst;
  final String? email;
  final String? phone;
  final Patient patient;

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
              Text(
                "${index! + 1}.$name",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: ColorConstents.textcolor),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 22, top: 5),
                child: Text(
                  tretmentName ?? "",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: ColorConstents.buttonColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContentIconWidget(
                      path: PathConstsnts.calender,
                      text: date ?? "",
                    ),
                    ContentIconWidget(
                      path: PathConstsnts.person,
                      text: user ?? "",
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: ColorConstents.colorGrey.withOpacity(0.2),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: InkWell(
                  onTap: () {

                    generatePDF(
                      patient: patient,
                        address: adress ?? "",
                        name: name ?? "",
                        branch: branch ?? "",
                        date: date ?? "",
                        time: time ?? "",
                        gst: gst ?? "",
                        email: email ?? "",
                        booked: "",
                        phone: phone ?? "");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "View Booking details",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: ColorConstents.textcolor),
                      ),
                      Icon(CupertinoIcons.chevron_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
