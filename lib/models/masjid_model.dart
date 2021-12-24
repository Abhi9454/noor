class MahdaviaModel {
  final String mahdaviaId;
  final String mahdaviaTitle;
  final String mahdaviaActivities;
  final String mahdaviaDetails;

  MahdaviaModel({required this.mahdaviaId,
    required this.mahdaviaTitle,
    required this.mahdaviaActivities,
    required this.mahdaviaDetails,
  });

  factory MahdaviaModel.fromJson(Map<String, dynamic> json) {
    return MahdaviaModel(
      mahdaviaId: json['id'],
      mahdaviaTitle: json['title'],
      mahdaviaActivities: json['activities'],
      mahdaviaDetails: json['details'],
    );
  }
}