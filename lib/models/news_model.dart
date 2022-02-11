class NewsModel {
  final String newsId;
  final String newsTitle;
  final String newsDetail;
  final String newsDate;

  NewsModel({required this.newsId,
    required this.newsTitle,
    required this.newsDetail, required this.newsDate});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      newsId: json['id'],
      newsTitle: json['title'],
      newsDetail: json['details'],
      newsDate: json['publish_date'],
    );
  }
}