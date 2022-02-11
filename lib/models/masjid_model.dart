class MasjidModel {
  final String masjidId;
  final String masjidName;
  final String masjidState;
  final String masjidCity;
  final String masjidLongitude;
  final String masjidLatitude;
  final String masjidBiography;
  final String masjidReach;

  MasjidModel({required this.masjidId,
    required this.masjidName,
    required this.masjidState,
    required this.masjidCity,
    required this.masjidLatitude,
    required this.masjidLongitude,
    required this.masjidBiography,
    required this.masjidReach
  });

  factory MasjidModel.fromJson(Map<String, dynamic> json) {
    return MasjidModel(
      masjidId: json['id'],
      masjidName: json['name'],
      masjidState: json['state'],
      masjidCity: json['city'],
      masjidLatitude: json['latitude'],
      masjidLongitude: json['longitude'],
      masjidBiography: json['short_biography'],
      masjidReach: json['reach'],
    );
  }
}