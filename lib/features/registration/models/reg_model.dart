class RegModel {
  final String name;
  final String executive;
  final String payment;
  final String phone;
  final String address;
  final double totalAmount;
  final double discountAmount;
  final double advanceAmount;
  final double balanceAmount;
  final String dateAndTime;
  final String id;
  final List<int> male;
  final List<int> female;
  final String branch;
  final List<int> treatments;

  RegModel({
    required this.name,
    required this.executive,
    required this.payment,
    required this.phone,
    required this.address,
    required this.totalAmount,
    required this.discountAmount,
    required this.advanceAmount,
    required this.balanceAmount,
    required this.dateAndTime,
    this.id = "",
    required this.male,
    required this.female,
    required this.branch,
    required this.treatments,
  });

  // Factory constructor to create an instance from JSON
  factory RegModel.fromJson(Map<String, dynamic> json) {
    return RegModel(
      name: json['name'] ?? '',
      executive: json['executive'] ?? '',
      payment: json['payment'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
      discountAmount: (json['discount_amount'] ?? 0).toDouble(),
      advanceAmount: (json['advance_amount'] ?? 0).toDouble(),
      balanceAmount: (json['balance_amount'] ?? 0).toDouble(),
      dateAndTime: json['date_nd_time'] ?? '',
      id: json['id'] ?? '',
      male: (json['male'] as String).split(',').map((e) => int.parse(e)).toList(),
      female: (json['female'] as String).split(',').map((e) => int.parse(e)).toList(),
      branch: json['branch'] ?? '',
      treatments: (json['treatments'] as String).split(',').map((e) => int.parse(e)).toList(),
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'executive': executive,
      'payment': payment,
      'phone': phone,
      'address': address,
      'total_amount': totalAmount,
      'discount_amount': discountAmount,
      'advance_amount': advanceAmount,
      'balance_amount': balanceAmount,
      'date_nd_time': dateAndTime,
      'id': id,
      'male': male.join(','),
      'female': female.join(','),
      'branch': branch,
      'treatments': treatments.join(','),
    };
  }
}
