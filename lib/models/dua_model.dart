class DuaModel {
  final String duaId;
  final String duaTitle;
  final String duaDetail;
  final String duaDate;

  DuaModel({required this.duaId,
    required this.duaTitle,
    required this.duaDetail, required this.duaDate});

  factory DuaModel.fromJson(Map<String, dynamic> json) {
    return DuaModel(
      duaId: json['id'],
      duaTitle: json['title'],
      duaDetail: json['details'],
      duaDate: json['publish_date'],
    );
  }
}