class QuranModel {
  final String quranId;
  final String quranTitle;
  final String quranDetail;
  final String quranDate;

  QuranModel({required this.quranId,
    required this.quranTitle,
    required this.quranDetail, required this.quranDate});

  factory QuranModel.fromJson(Map<String, dynamic> json) {
    return QuranModel(
      quranId: json['id'],
      quranTitle: json['title'],
      quranDetail: json['details'],
      quranDate: json['publish_date'],
    );
  }
}