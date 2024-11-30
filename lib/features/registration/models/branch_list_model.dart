class BranchListModel {
  List<String>? branchs;
  String? error;
  BranchListModel({required this.branchs, this.error});
  factory BranchListModel.fromJson(Map<String, dynamic> json) {
    return BranchListModel(branchs: json["branchs"]);
  }
  Map<String, dynamic> toJson() {
    return {"branchs": branchs};
  }
}
