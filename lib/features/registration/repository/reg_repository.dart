import 'dart:convert';
import 'dart:developer';

import 'package:ayurvadic/core/local_storage.dart';
import 'package:ayurvadic/features/registration/models/branch_list_model.dart';
import 'package:ayurvadic/features/registration/models/reg_model.dart';
import 'package:ayurvadic/features/registration/models/treatment_list_model.dart';
import 'package:http/http.dart' as http;

class RegRepository {
  Future<bool> postRegistration(RegModel model) async {
    try {
      String? token = await LocalStorage.readToken();

      const url = "https://flutter-amr.noviindus.in/api/PatientUpdate";
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
          
        },
        body: jsonEncode(model.toJson()),
      );
      log("posst==========${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        
        return true;
      } else {
        log("posst==========${response.statusCode}");
        return true;
      }
    } catch (e) {
      log("posst==========$e");
      return true;
    }
  }

  Future<BranchListModel> getBranchList() async {
    try {
      String? token = await LocalStorage.readToken();

      const url = "https://flutter-amr.noviindus.in/api/BranchList";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<String> branches = [];
        var responseData = jsonDecode(response.body);
        List branchModel = responseData["branches"] as List;
        for (var value in branchModel) {
          Map<String, dynamic> data = value as Map<String, dynamic>;

          branches.add(data["name"]);
        }
        log("$branches         2");
        return BranchListModel(branchs: branches, error: null);
      } else {
        return BranchListModel(branchs: [], error: "Something went wrong");
      }
    } catch (e) {
      log("$e branch");
      return BranchListModel(branchs: [], error: "Something went wrong");
    }
  }

  Future<TreatmentListModel> getTreatmentList() async {
    try {
      String? token = await LocalStorage.readToken();

      const url = "https://flutter-amr.noviindus.in/api/TreatmentList";
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      log("${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<String> treatments = [];
        var responseData = jsonDecode(response.body);
        List branchModel = responseData["treatments"] as List;
        for (var value in branchModel) {
          Map<String, dynamic> data = value as Map<String, dynamic>;

          treatments.add(data["name"]);
        }

        return TreatmentListModel(treatment: treatments, error: null);
      } else {
        return TreatmentListModel(treatment: [], error: "Something went wrong");
      }
    } catch (e) {
      log("$e branch");
      return TreatmentListModel(treatment: [], error: "Something went wrong");
    }
  }
}
