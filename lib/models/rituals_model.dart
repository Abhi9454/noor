class RitualModel {
  final String ritualId;
  final String ritualTitle;
  final String ritualDetail;
  final String ritualDate;

  RitualModel({required this.ritualId,
    required this.ritualTitle,
    required this.ritualDetail, required this.ritualDate});

  factory RitualModel.fromJson(Map<String, dynamic> json) {
    return RitualModel(
      ritualId: json['id'],
      ritualTitle: json['title'],
      ritualDetail: json['details'],
      ritualDate: json['publish_date'],
    );
  }
}