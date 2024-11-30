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
  static List<String> minutes=["5","10","15","20","25","30","35","40","45","50","55","60"];
  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2, 8)}'; // Removes the alpha value
  }
static  String converDateFormate(String? givenDate){
     DateTime dateTime = DateTime.parse(givenDate!);

  String formattedDate = DateFormat('d/M/yyyy').format(dateTime);
  return formattedDate;
  }
static  String converDateFormateForReg(String? givenDate){
     String inputDate = "2024-11-23 00:00:00.000";
  DateTime parsedDate = DateTime.parse(inputDate);
  String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
  
  print(formattedDate);
  return formattedDate;
  }
}
