import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static const List<String> paymentOptions = [
    "Cash",
    "Card",
    "UPI",
  ];
  static const List<String> pdfTableTitle = [
    "Treatment",
    "Male",
    "Female",
    "Total"
  ];
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}'; // Removes the alpha value
  }
static  String converDateFormate(String? givenDate){
     DateTime dateTime = DateTime.parse(givenDate!);

  String formattedDate = DateFormat('d/M/yyyy').format(dateTime);
  return formattedDate;
  }
}
