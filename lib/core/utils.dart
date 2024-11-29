import 'package:flutter/material.dart';

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
}
