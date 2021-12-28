import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/helpers/set_user_details.dart';
import 'package:noor/models/user_model.dart';
import '../helpers/enum.dart';
import '../services/register_page_service.dart';

class RegisterPageViewModel extends ChangeNotifier {
  final RegisterService _registerService = RegisterService();
  RegisterStatus _registerStatus = RegisterStatus.pending;
  final UserDetailsSet setUser = UserDetailsSet();
  late String registerErrorMessage;
  String ahle = 'Select Ahle Khandan';

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
      List<UserModel> list = ((_userDetails['data'] as List).map((i) => UserModel.fromJson(i)).toList());
      setUser.setUserDetails(
          list[0].userId,
          list[0].userFullName,
          list[0].userEmail,
          list[0].userDob,
          list[0].userAhle,
          list[0].userMurshidName,
          list[0].userMasjidName);
      _registerStatus = RegisterStatus.success;
    }
    notifyListeners();
  }

  setAhleValue(String ahle){
    this.ahle = ahle;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  register(String name, String dob, String email, String password,
      String murshidName, String masjidName) async {
    try {
      _registerStatus = RegisterStatus.loading;
      _setUserDetails(await _registerService.register(
          name, dob, email, password, ahle, murshidName, masjidName));
    } on ShowError catch (error) {
      _registerStatus = RegisterStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
