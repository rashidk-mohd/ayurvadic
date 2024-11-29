import 'package:ayurvadic/contants/color_constents.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

pw.Widget patientDetailsWidget(String? header, String? result) {
  return pw.Row(children: [
    pw.Text(
      header!,
      style: pw.TextStyle(
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
        color:
            PdfColor.fromHex(Utils.colorToHex(ColorConstents.textcolor))
      ),
    ),
  
    pw.Text(
      result ?? "",
      style: pw.TextStyle(
        fontSize: 16,
        fontWeight: pw.FontWeight.bold,
        color:
            PdfColor.fromHex(Utils.colorToHex(ColorConstents.textcolor2)),
      ),
    ),
  ]);
}
pw.Widget nameAndBookedWidget({String? name, String? booked}) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
    patientDetailsWidget("Name:", name??"No result"),
    patientDetailsWidget("Booked On:", booked?? "No result"),
  ]);
}
pw.Widget addressAndDateWidget({String? address, String? date}) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
    patientDetailsWidget("Address:", address??"No result"),
    patientDetailsWidget("Treatment Date:", date?? "No result"),
  ]);
}
pw.Widget wNumberAndTimeWidget({String? number, String? time}) {
  return pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
    patientDetailsWidget("Whatsapp number:", number??"No result"),
    patientDetailsWidget("Treatment Time:", time?? "No result"),
  ]);
}
