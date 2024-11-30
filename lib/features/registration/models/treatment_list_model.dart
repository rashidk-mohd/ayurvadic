class TreatmentListModel {
   List<String>? treatment;
  String? error;
  TreatmentListModel({required this.treatment, this.error});
  factory TreatmentListModel.fromJson(Map<String, dynamic> json) {
    return TreatmentListModel(treatment: json["treatment"]);
  }
  Map<String, dynamic> toJson() {
    return {"treatment": treatment};
  }
}