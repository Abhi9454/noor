class CalenderModel {
  final String calenderId;
  final String calenderDate;
  final String calenderDetails;

  CalenderModel({required this.calenderId,
    required this.calenderDate,
    required this.calenderDetails});

  factory CalenderModel.fromJson(Map<String, dynamic> json) {
    return CalenderModel(
        calenderId: json['id'],
        calenderDate: json['date'],
        calenderDetails: json['details'],
    );
  }
}