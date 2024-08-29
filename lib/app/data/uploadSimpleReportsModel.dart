class UploadSimpleReportsModel {
  String? reports;
  String? gender;
  String? patientName;
  String? bookingId;
  String? phoneNo;
  String? address;
  String? bookingDate;
  String? bookingTime;
  String? totalBill;
  String? userId;
  String? packageName;
  String? additionalRemarks;
  String? reportGenerateDateTime;

  // Constructor
  UploadSimpleReportsModel(
      {this.reports,
      this.gender,
      this.patientName,
      this.bookingId,
      this.phoneNo,
      this.packageName,
      this.userId,
      this.address,
      this.reportGenerateDateTime,
      this.bookingDate,
      this.bookingTime,
      this.additionalRemarks,
      this.totalBill});

  // Factory method to create a model instance from a map (usually used for parsing JSON data)
  factory UploadSimpleReportsModel.fromJson(Map<String, dynamic> json) {
    return UploadSimpleReportsModel(
      reports: json['reports'],
      gender: json['gender'],
      userId: json['userId'],
      patientName: json['patientName'],
      bookingId: json['bookingId'],
      phoneNo: json['phoneNo'],
      packageName: json['packageName'],
      reportGenerateDateTime: json['reportGenerateDateTime'],
      address: json['address'],
      bookingDate: json['bookingDate'],
      bookingTime: json['bookingTime'],
      additionalRemarks: json['additionalRemarks'],
      totalBill: json['totalBill'],
    );
  }

  // Method to convert the model instance to a map (usually used for converting to JSON data)
  Map<String, dynamic> toJson() {
    return {
      'reports': reports,
      'gender': gender,
      'reportGenerateDateTime': reportGenerateDateTime,
      'userId': userId,
      'patientName': patientName,
      'bookingId': bookingId,
      'phoneNo': phoneNo,
      'address': address,
      "packageName":packageName,
      'bookingDate': bookingDate,
      'bookingTime': bookingTime,
      'additionalRemarks': additionalRemarks,
      'totalBill': totalBill,
    };
  }
}
