import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/services/home_page_service.dart';
import '../helpers/read_user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends ChangeNotifier{

  late SharedPreferences preferences;
  final HomePageService _homePageService = HomePageService();
  final UserDetails _userDetails = UserDetails();
  bool _disposed = false;
  late String dailyQuizUrl;

  int totalPendingAmount = 0;

  Status _status = Status.init;

  Status get status => _status;

  HomePageUserStatus _userStatus = HomePageUserStatus.pendingVerification;

  HomePageUserStatus get userStatus => _userStatus;


  init() async {
    String userId = await _userDetails.getId();
    if (userId.isEmpty) {
      _userStatus = HomePageUserStatus.userNotVerified;
    }
    notifyListeners();
  }

  logout() async {
    preferences = await SharedPreferences.getInstance();
    preferences.clear();
    _userStatus = HomePageUserStatus.userNotVerified;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetchDailyQuizUrl() async{
    try {
      _status = Status.loading;
      dailyQuizUrl = await _homePageService.fetchDailyQuiz();
    } on ShowError catch (error) {
    _status = Status.error;
    _setError(error);
    }
    notifyListeners();
  }
}