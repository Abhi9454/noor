import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/helpers/set_user_details.dart';
import '../helpers/enum.dart';
import '../services/register_page_service.dart';

class RegisterPageViewModel extends ChangeNotifier {
  final RegisterService _registerService = RegisterService();
  RegisterStatus _registerStatus = RegisterStatus.pending;
  final UserDetailsSet setUser = UserDetailsSet();
  late String registerErrorMessage;

  RegisterStatus get registerStatus => _registerStatus;

  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    _userDetails = userDetails;
    if (_userDetails['success'] == 0) {
      _registerStatus = RegisterStatus.failed;
      registerErrorMessage = _userDetails['message'];
      log('userDetails after error'+ _userDetails.toString());
    } else {
      setUser.setUserDetails(
          _userDetails['id'],
          _userDetails['fullname'],
          _userDetails['emailid'],
          _userDetails['dob'],
          _userDetails['ahle'],
          _userDetails['murshidname'],
          _userDetails['masjidname']);
      _registerStatus = RegisterStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  register(String name, String dob, String email, String password, String ahle,
      String murshidName, String masjidName) async {
    try {
      _registerStatus = RegisterStatus.loading;
      notifyListeners();
      _setUserDetails(await _registerService.register(
          name, dob, email, password, ahle, murshidName, masjidName));
    } on ShowError catch (error) {
      _registerStatus = RegisterStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
