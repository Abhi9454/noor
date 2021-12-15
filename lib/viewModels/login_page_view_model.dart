import 'package:flutter/cupertino.dart';
import 'package:noor/models/user_model.dart';
import '../helpers/set_user_details.dart';
import '../services/login_page_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';


class LoginPageViewModel extends ChangeNotifier {
  final AuthenticateService _authenticateService = AuthenticateService();
  LoginStatus _loginStatus = LoginStatus.pending;
  final UserDetailsSet setUser = UserDetailsSet();

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    _userDetails = userDetails;
    if(_userDetails['success'] == 0){
      _loginStatus = LoginStatus.failed;
    }
    else{
      List<UserModel> list = ((_userDetails['data'] as List).map((i) => UserModel.fromJson(i)).toList());
      setUser.setUserDetails(
          list[0].userId,
          list[0].userFullName,
          list[0].userEmail,
          list[0].userDob,
          list[0].userAhle,
          list[0].userMurshidName,
          list[0].userMasjidName);
      _loginStatus = LoginStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  login(String email, String password) async {
    try {
      _loginStatus = LoginStatus.loading;
      notifyListeners();
      _setUserDetails(await _authenticateService.login(email, password));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}