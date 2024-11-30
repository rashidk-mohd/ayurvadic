import 'dart:developer';
import 'dart:io';

import 'package:ayurvadic/common/botton_widget.dart';
import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/contants/path_constsnts.dart';
import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/controllers/home_controller.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/widgets/home_content_card.dart';
import 'package:ayurvadic/features/home/widgets/pdf_widget.dart';
import 'package:ayurvadic/features/home/widgets/search_widget.dart';
import 'package:ayurvadic/features/home/widgets/sorting_widget.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Patient> filteredItems = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    Provider.of<HomeController>(context, listen: false).getPatientList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            PathConstsnts.backarrow,
            height: 24,
            width: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              PathConstsnts.notificationicon,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      body: homeController.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchWidget(),
                  const SortingWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 2,
                    color: ColorConstents.colorGrey.withOpacity(0.2),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: homeController.patientList.length,
                      itemBuilder: (context, index) {
                        final patientList = homeController.patientList[index];
                        return HomeContentCard(
                          index: index,
                          name: patientList.name,
                          time: patientList.dateNdTime == null
                              ? ""
                              : Utils.converDateFormate(
                                  patientList.dateNdTime.toString()),
                          tretmentName:
                              patientList.patientdetailsSet![0].treatmentName,
                          date: patientList.dateNdTime == null
                              ? ""
                              : Utils.converDateFormate(
                                  patientList.dateNdTime.toString()),
                          user: patientList.user,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ButtonWidget(
          title: "Register Now",
          onPressed: () {
            Navigator.of(context).pushNamed(Routes.registation);
          },
          buttonColor: ColorConstents.buttonColor,
        ),
      ),
    );
  }
}

Future<void> _generatePDF() async {
  final pdf = pw.Document();
  log("message");
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "Kumarakam",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor)),
              ),
            ),
            pw.Text(
              "Cheepunkal P.O. Kumarakom, kottayam, Kerala - 686563",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              "e-mail: unknown@gmail.com",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              "Mob: +91 9876543210 | +91 9786543210",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              "GST No: 32AABCU9603R1ZW",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.SizedBox(height: 20),
            pw.Divider(
                height: 1,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.colorGrey))),
            pw.SizedBox(height: 20),
            pw.Text(
              "Patient Details",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.buttonColor)),
              ),
            ),
            pw.SizedBox(height: 20),
            nameAndBookedWidget(name: "Salih", booked: "31/01/2024 | 12:23"),
            pw.SizedBox(height: 10),
            addressAndDateWidget(
                address: "Nadakkavu,Kozhikkode", date: "21/4/2024"),
            pw.SizedBox(height: 10),
            wNumberAndTimeWidget(number: "9963533655", time: "12:30"),
          ],
        );
      },
    ),
  );

  // Get the directory to save the PDF
  final output = await getTemporaryDirectory();
  final file = File("${output.path}/new2.pdf");

  // Save the PDF file
  await file.writeAsBytes(await pdf.save());

  // Open the PDF
  OpenFile.open(file.path);
  log("message2");
}
