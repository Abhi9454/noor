import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/location_model.dart';
import 'package:noor/models/quiz_model.dart';
import 'package:noor/services/home_page_service.dart';
import 'package:noor/services/location_service.dart';
import '../helpers/read_user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

class HomePageViewModel extends ChangeNotifier{

  late SharedPreferences preferences;
  final HomePageService _homePageService = HomePageService();
  final UserDetails _userDetails = UserDetails();
  final LocationService _locationService = LocationService();
  bool _disposed = false;
  String fajrTimings = '';
  String maghribTimings = '';
  late Welcome _welcome;
  LocationData? _locationData;
  String formattedDate = '' ;
  String readableDate = '';
  final Location location = Location();


  getLocation() async{
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy');
    formattedDate = formatter.format(now);
    bool _serviceEnabled = false;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
  }

  int totalPendingAmount = 0;

  List<QuizModel> dailyQuiz = [];

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
      dailyQuiz = await _homePageService.fetchDailyQuiz();
      _status = Status.success;
    } on ShowError catch (error) {
    _status = Status.error;
    _setError(error);
    }
    notifyListeners();
  }


  fetchLocationDetails() async{
    await getLocation();
    try {
      _status = Status.loading;
      _welcome = await _locationService.fetchLocationDetails(formattedDate, _locationData!.latitude.toString(), _locationData!.longitude.toString());
      fajrTimings = _welcome.data.timings.fajr;
      readableDate = _welcome.data.date.readable;
      maghribTimings = _welcome.data.timings.maghrib;
      _status = Status.success;
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}