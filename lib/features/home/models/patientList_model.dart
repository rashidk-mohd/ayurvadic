// To parse this JSON data, do
//
//     final patientListModel = patientListModelFromJson(jsonString);

import 'dart:convert';

PatientListModel patientListModelFromJson(String str) =>
    PatientListModel.fromJson(json.decode(str));

class PatientListModel {
  bool status;
  String message;
  List<Patient>? patient;

  PatientListModel({
    required this.status,
    required this.message,
    this.patient,
  });

  factory PatientListModel.fromJson(Map<String, dynamic> json) =>
      PatientListModel(
        status: json["status"] ?? false,
        message: json["message"] ?? "",
        patient: json["patient"] == null
            ? []
            : List<Patient>.from(
                json["patient"].map((x) => Patient.fromJson(x))),
      );
}

class Patient {
  int? id;
  List<PatientdetailsSet>? patientdetailsSet;
  Branch? branch;
  String? user;
  String? payment;
  String? name;
  String? phone;
  String? address;
  double? price;
  int? totalAmount;
  int? discountAmount;
  int? advanceAmount;
  int? balanceAmount;
  DateTime? dateNdTime;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  Patient({
    this.id,
    this.patientdetailsSet,
    this.branch,
    this.user,
    this.payment,
    this.name,
    this.phone,
    this.address,
    this.price,
    this.totalAmount,
    this.discountAmount,
    this.advanceAmount,
    this.balanceAmount,
    this.dateNdTime,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        patientdetailsSet: json["patientdetails_set"] == null
            ? []
            : List<PatientdetailsSet>.from(json["patientdetails_set"]
                .map((x) => PatientdetailsSet.fromJson(x))),
        branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
        user: json["user"] ?? "",
        payment: json["payment"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        price: json["price"]?.toDouble(),
        totalAmount: json["total_amount"] ?? 0,
        discountAmount: json["discount_amount"] ?? 0,
        advanceAmount: json["advance_amount"] ?? 0,
        balanceAmount: json["balance_amount"] ?? 0,
        dateNdTime: json["date_nd_time"] == null
            ? null
            : DateTime.tryParse(json["date_nd_time"]),
        isActive: json["is_active"] ?? false,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );
}

class Branch {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branch({
    this.id,
    this.name,
    this.patientsCount,
    this.location,
    this.phone,
    this.mail,
    this.address,
    this.gst,
    this.isActive,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["id"],
        name: json["name"] ?? "",
        patientsCount: json["patients_count"] ?? 0,
        location: json["location"] ?? "",
        phone: json["phone"] ?? "",
        mail: json["mail"] ?? "",
        address: json["address"] ?? "",
        gst: json["gst"] ?? "",
        isActive: json["is_active"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "patients_count": patientsCount,
        "location": location,
        "phone": phone,
        "mail": mail,
        "address": address,
        "gst": gst,
        "is_active": isActive,
      };
}

class PatientdetailsSet {
  int? id;
  String? male;
  String? female;
  int? patient;
  int? treatment;
  String? treatmentName;

  PatientdetailsSet({
    this.id,
    this.male,
    this.female,
    this.patient,
    this.treatment,
    this.treatmentName,
  });

  factory PatientdetailsSet.fromJson(Map<String, dynamic> json) =>
      PatientdetailsSet(
        id: json["id"],
        male: json["male"] ?? "",
        female: json["female"] ?? "",
        patient: json["patient"],
        treatment: json["treatment"],
        treatmentName: json["treatment_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "male": male,
        "female": female,
        "patient": patient,
        "treatment": treatment,
        "treatment_name": treatmentName,
      };
}
