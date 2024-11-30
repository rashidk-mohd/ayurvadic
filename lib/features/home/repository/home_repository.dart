import 'dart:convert';
import 'dart:developer';

import 'package:ayurvadic/core/local_storage.dart';
import 'package:ayurvadic/features/home/models/patientList_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<PatientListModel> getPatientList() async {
    try {
      String? token = await LocalStorage.readToken();
      const url = "https://flutter-amr.noviindus.in/api/PatientList";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<Patient> patientList = [];
        var responseData = jsonDecode(response.body) as Map;
        log('0 ${ responseData["patient"][2] }');
        List<dynamic> patientResponseList =
            responseData["patient"] as List<dynamic>;
        for (var value in patientResponseList) {
          patientList.add(Patient.fromJson(value));
        }
        return PatientListModel(status: true, message: "Success", patient: patientList);
      } else {
        return PatientListModel(
          status: false,
          message: "failed",
          patient: [],
        );
      }
    } catch (e) {
      log("home error $e");
      return PatientListModel(
        status: false,
        message: "failed",
        patient: [],
      );
    }
  }
}
