class VideoModel {
  final String videoId;
  final String videoLanguage;
  final String videoPath;
  final String videoAbout;

  VideoModel({required this.videoId,
    required this.videoLanguage,
    required this.videoPath, required this.videoAbout});

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      videoId: json['id'],
      videoLanguage: json['langauge'],
      videoPath: json['visualpath'],
      videoAbout: json['about'],
    );
  }
}