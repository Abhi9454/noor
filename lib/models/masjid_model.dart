class MasjidModel {
  final String masjidId;
  final String masjidName;
  final String masjidState;
  final String masjidCity;
  final String masjidLongitude;
  final String masjidLatitude;
  final String masjidBiography;
  final String masjidReach;
  final String masjidDarah;
  final String shortBiography;
  final String masjidImage;

  MasjidModel({required this.masjidId,
    required this.masjidName,
    required this.masjidState,
    required this.masjidCity,
    required this.masjidLatitude,
    required this.masjidLongitude,
    required this.masjidBiography,
    required this.masjidReach,
    required this.masjidDarah,
    required this.shortBiography,
    required this.masjidImage,
  });

  factory MasjidModel.fromJson(Map<String, dynamic> json) {
    return MasjidModel(
      masjidId: json['id'],
      masjidName: json['name'] ?? '',
      masjidState: json['state'] ?? '',
      masjidCity: json['city'] ?? '',
      masjidLatitude: json['latitude'] ?? '26.810259',
      masjidLongitude: json['longitude'] ?? '75.543571',
      masjidBiography: json['short_biography'] ?? '',
      masjidReach: json['reach'],
      masjidDarah: json['dairah'] ?? '',
      shortBiography: json['short_biography'] ?? '',
      masjidImage: json['image'] ?? '',
    );
  }
}