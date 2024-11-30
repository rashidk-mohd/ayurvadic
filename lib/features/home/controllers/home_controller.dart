import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:ayurvadic/features/home/repository/home_repository.dart';
import 'package:flutter/foundation.dart';

class HomeController with ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();
  List<Patient> patientList = [];
  bool isLoading = false;
  Future<void> getPatientList() async {
    isLoading = true;
    final result = await homeRepository.getPatientList();
    if (result.status) {
      patientList = result.patient ?? [];
    } else {
      print("error home");
    }
    isLoading = false;
    notifyListeners();
  }
}
