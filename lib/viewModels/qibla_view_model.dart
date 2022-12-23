import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import '../helpers/read_user_details.dart';
import '../models/location_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/home_page_service.dart';
import '../services/location_service.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class QiblaViewModel extends ChangeNotifier{
  late SharedPreferences preferences;
  final HomePageService _homePageService = HomePageService();
  final UserDetails _userDetails = UserDetails();
  final LocationService _locationService = LocationService();
  bool _disposed = false;
  String fajrTimings = '';
  String maghribTimings = '';
  String zuhrTimings = '';
  String ashTimings = '';
  String ishaTimings = '';
  String sunriseTimings = '';
  String sunsetTimings = '';
  late Welcome _welcome;
  LocationData? _locationData;
  String formattedDate = '' ;
  String readableDate = '';
  final Location location = Location();


  getLocation(BuildContext context) async{
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
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Location Access'),
              content: const Text('Please provide Location Access to enable feature.'),
              actions: [
                TextButton(
                  child: const Text('Open Settings'),
                  onPressed: () async{
                    await  permission.openAppSettings();
                  },
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }

    _locationData = await location.getLocation();
  }

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



  fetchLocationDetails(BuildContext context) async{
    await getLocation(context);
    try {
      _status = Status.loading;
      preferences = await SharedPreferences.getInstance();
      preferences.setString('date', formattedDate);
      preferences.setString('lat', _locationData!.latitude.toString() );
      preferences.setString('lon', _locationData!.longitude.toString());
      _welcome = await _locationService.fetchLocationDetails(formattedDate, _locationData!.latitude.toString(), _locationData!.longitude.toString());
      fajrTimings = _welcome.data.timings.fajr;
      readableDate = _welcome.data.date.readable;
      maghribTimings = _welcome.data.timings.maghrib;
      sunriseTimings = _welcome.data.timings.sunrise;
      sunsetTimings = _welcome.data.timings.sunset;
      zuhrTimings = _welcome.data.timings.dhuhr;
      ashTimings = _welcome.data.timings.asr;
      ishaTimings = _welcome.data.timings.isha;
      _status = Status.success;
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}