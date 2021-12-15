class UserModel {
  final String userId;
  final String userFullName;
  final String userEmail;
  final String userDob;
  final String userAhle;
  final String userMasjidName;
  final String userMurshidName;

  UserModel(
      {required this.userId,
        required this.userFullName,
        required this.userEmail,
        required this.userDob,
        required this.userAhle,
        required this.userMasjidName,
        required this.userMurshidName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'],
      userFullName: json['fullname'],
      userDob: json['dob'],
      userEmail: json['emailid'],
      userAhle: json['ahle'],
      userMasjidName: json['masjidname'],
      userMurshidName: json['murshidname'],
    );
  }
}