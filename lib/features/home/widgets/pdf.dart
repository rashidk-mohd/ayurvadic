import 'dart:developer';
import 'dart:io';

import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/widgets/pdf_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';

Future<void> generatePDF(
    {String? branch,
    String? address,
    String? email,
    String? phone,
    String? gst,
    String? name,
    String? time,
    String? date,
    Patient? patient,
    String? booked}) async {
  var patientDetails = patient!.patientdetailsSet![0];
  var branch = patient.branch;

  String treatmentName = patientDetails.treatmentName ?? "";
  int price = patient.totalAmount ?? 0;
  int maleCount = int.tryParse(patient.patientdetailsSet![0].male ?? "0") ?? 0;
  int femaleCount =
      int.tryParse(patient.patientdetailsSet![0].female ?? "0") ?? 0;
  int total = price * (maleCount + femaleCount);
  final pdf = pw.Document();
  log("message");
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              "${branch!.name}",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.bold,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor)),
              ),
            ),
            pw.Text(
              address ?? "",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              email ?? "",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              phone ?? "",
              style: pw.TextStyle(
                fontSize: 16,
                fontWeight: pw.FontWeight.normal,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.textcolor2)),
              ),
            ),
            pw.Text(
              gst ?? "",
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
            nameAndBookedWidget(name: name, booked: booked),
            pw.SizedBox(height: 10),
            addressAndDateWidget(address: address, date: date),
            pw.SizedBox(height: 10),
            wNumberAndTimeWidget(number: phone, time: "$time"),
            pw.SizedBox(height: 20),
            pw.Divider(
                height: 1,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.colorGrey))),
            pw.SizedBox(height: 50),
            pw.Row(
              children: [
                pw.Text('Treatment',
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.buttonColor)))),
                pw.SizedBox(width: 70),
                pw.Text('Price',
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.buttonColor)))),
                pw.SizedBox(width: 70),
                pw.Text('Male',
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.buttonColor)))),
                pw.SizedBox(width: 70),
                pw.Text('Female',
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.buttonColor)))),
                pw.SizedBox(width: 70),
                pw.Text('Total',
                    style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.buttonColor)))),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.start,
              children: [
                pw.Text(treatmentName,
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.textcolor)))),
                pw.SizedBox(width: 80),
                pw.Text('\$$price',
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.textcolor)))),
                pw.SizedBox(width: 80),
                pw.Text('$maleCount',
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.textcolor)))),
                pw.SizedBox(width: 80),
                pw.Text('$femaleCount',
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.textcolor)))),
                pw.SizedBox(width: 80),
                pw.Text('\$$total',
                    style: pw.TextStyle(
                        fontSize: 12,
                        color: PdfColor.fromHex(
                            Utils.colorToHex(ColorConstents.textcolor)))),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Divider(
                height: 1,
                color: PdfColor.fromHex(
                    Utils.colorToHex(ColorConstents.colorGrey))),
            pw.SizedBox(height: 20),
            pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
              tileWidget("Total Amount", total.toString()),
              pw.SizedBox(height: 10),
              tileWidget("Discount", patient.discountAmount.toString()),
              pw.SizedBox(height: 10),
              tileWidget("Advance", patient.advanceAmount.toString()),
              pw.SizedBox(height: 10),
              pw.Divider(
                  height: 1,
                  color: PdfColor.fromHex(
                      Utils.colorToHex(ColorConstents.colorGrey))),
              tileWidget("Balance", patient.balanceAmount.toString()),
              pw.SizedBox(height: 50),
              pw.Text("Thank you for choosing us",
                  style: pw.TextStyle(
                      fontWeight: pw.FontWeight.bold,
                      color: PdfColor.fromHex(
                          Utils.colorToHex(ColorConstents.buttonColor)))),
            ])
          ],
        );
      },
    ),
  );

  final output = await getTemporaryDirectory();
  final file = File("${output.path}/$gst/$name.pdf");
  await file.writeAsBytes(await pdf.save());
  OpenFile.open(file.path);
  log("message 2 ");
}

pw.Widget tileWidget(String? title, String? ans) {
  return pw.Row(children: [
    pw.Text("$title",
        style: pw.TextStyle(
            fontWeight: pw.FontWeight.bold,
            color:
                PdfColor.fromHex(Utils.colorToHex(ColorConstents.textcolor)))),
    pw.SizedBox(width: 20),
    pw.Text("${ans}",
        style: pw.TextStyle(
            fontWeight: pw.FontWeight.normal,
            color:
                PdfColor.fromHex(Utils.colorToHex(ColorConstents.textcolor))))
  ]);
}
