import 'dart:developer';

import 'package:ayurvadic/contants/routes_const.dart';
import 'package:ayurvadic/core/utils.dart';
import 'package:ayurvadic/features/registration/models/reg_model.dart';
import 'package:ayurvadic/features/registration/repository/reg_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegController with ChangeNotifier {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController wnumberController = TextEditingController();
  TextEditingController addresController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountamoutcontroller = TextEditingController();
  TextEditingController advanceAmountController = TextEditingController();
  TextEditingController balancAmountController = TextEditingController();
  RegRepository repo = RegRepository();
  bool isLoading = false;
  bool getIsLoding = false;
  List<String> branches = [];
  List<String> treatments = [];
  int malecount = 0;
  int femaleCount = 0;
  List<String> hours = [];
  List<int> minutes = [];
  String? selectedbranch;
  DateTime? selectedDate;
  String? selectedDateFormatted;

  String? paymentSelectedOption;
  Future postRegistration(BuildContext context, RegModel model) async {
    isLoading = true;
    final result = await repo.postRegistration(model);
    if (result) {
      Navigator.of(context).pushNamed(Routes.home);
    } else {
      print("post error");
    }
    isLoading = false;
    notifyListeners();
  }

  Future getBranch() async {
    final result = await repo.getBranchList();
    if (result.error == null) {
      branches = result.branchs ?? [];
      print("post $branches");
    } else {
      print("post error");
    }

    notifyListeners();
  }

  Future gettreatments() async {
    final result = await repo.getTreatmentList();
    if (result.error == null) {
      treatments = result.treatment ?? [];
    } else {
      print("post error");
    }
  }

  getdropDownLists() {
    getIsLoding = true;
    getBranch();
    gettreatments();
    getIsLoding = false;
  }

  int maleAdd() {
    malecount = malecount + 1;
    notifyListeners();
    log(malecount.toString());
    return malecount;
  }

  int femaleAdd() {
    femaleCount = femaleCount + 1;
    notifyListeners();
    return femaleCount;
  }

  int femaleMinus() {
    femaleCount = femaleCount - 1;
    notifyListeners();
    return femaleCount;
  }

  int maleMinus() {
    malecount = malecount - 1;
    notifyListeners();
    return malecount;
  }

  String? selectedBranch(String value) {
    selectedbranch = value;
    notifyListeners();
    return selectedbranch;
  }

  String? payMentOption(String value) {
    paymentSelectedOption = value;
    notifyListeners();
    return paymentSelectedOption;
  }

  List<String> hoursList() {
    for (int i = 0; i <= 12; i++) {
      hours.add(i.toString());
    }
    return hours;
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
      selectedDateFormatted =
          Utils.converDateFormateForReg(selectedDate.toString());
      print(selectedDateFormatted);
      notifyListeners();
    }
  }
}
