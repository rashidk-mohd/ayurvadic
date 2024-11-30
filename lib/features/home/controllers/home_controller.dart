import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/repository/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  List<Patient> patientList = [];
  bool isLoading = false;
  DateTime? selectedDate;
  String? selectedDateFormatted;
  List<Patient> filteredItems = [];
  Future<void> getPatientList() async {
    isLoading = true;
    final result = await homeRepository.getPatientList();
    if (result.status) {
      patientList = result.patient ?? [];
      filteredItems = patientList;
    } else {
      print("error home");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      print(selectedDateFormatted);
      selectedDateFormatted =
          Utils.converDateFormateForReg(selectedDate.toString());
      notifyListeners();
    }
  }

  sortListByDate(context) {
    selectDate(context).then((value) {
      for (var value in filteredItems) {
        filteredItems.clear();
        if (Utils.converDateFormate(value.dateNdTime.toString()) ==
            Utils.converDateFormate(selectedDateFormatted)) {
          filteredItems.add(value);
        }
      }
    });
    notifyListeners();
  }

  void filterItems(String query) {
    final results = patientList.where((item) {
      final nameLower = item.name!.toLowerCase();
      final categoryLower = item.address!.toLowerCase();
      final queryLower = query.toLowerCase();

      return nameLower.contains(queryLower) ||
          categoryLower.contains(queryLower);
    }).toList();

    filteredItems = results;
    notifyListeners();
  }
}
