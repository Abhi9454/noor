import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  late SharedPreferences preferences;

  Future<String> getId() async {
    preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString('userId') ?? '';
    return userId;
  }

  Future<String> getUserFullName() async {
    preferences = await SharedPreferences.getInstance();
    String userName = preferences.getString('userFullName') ?? '';
    return userName;
  }

  Future<String> getUserEmail() async {
    preferences = await SharedPreferences.getInstance();
    String userEmail = preferences.getString('userEmail') ?? '';
    return userEmail;
  }
}