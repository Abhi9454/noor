import 'package:shared_preferences/shared_preferences.dart';

class UserDetailsSet {
  late SharedPreferences preferences;
  bool success = false;

  Future<bool> setUserDetails(String userId, String userFullName, String userEmail, String userDob, String userAhle, String userMurshidName, String userMasjidName) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('userId', userId);
    preferences.setString('userFullName', userFullName);
    preferences.setString('userEmail', userEmail);
    preferences.setString('userDob', userDob );
    preferences.setString('userAhle', userAhle);
    preferences.setString('userMurshidName', userMurshidName);
    preferences.setString('userMasjidName', userMasjidName);
    success = true;
    return success;
  }
}