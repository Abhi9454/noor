class AudioModel {
  final String audioId;
  final String audioLanguage;
  final String audioPath;
  final String audioAbout;

  AudioModel({required this.audioId,
    required this.audioLanguage,
    required this.audioPath, required this.audioAbout});

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      audioId: json['id'],
      audioLanguage: json['langauge'],
      audioPath: json['audiopath'],
      audioAbout: json['about'],
    );
  }
}