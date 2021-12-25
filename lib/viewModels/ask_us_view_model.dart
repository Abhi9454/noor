import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/helpers/read_user_details.dart';
import 'package:noor/services/ask_service.dart';

class AskUsViewModel extends ChangeNotifier {

  final AskService _askService = AskService();
  final UserDetails _userDetails = UserDetails();

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

  late Map<String, dynamic> _askQuestionStatus;

  Map<String, dynamic> get askQuestionStatus => _askQuestionStatus;

  Future<void> _setAskStatus(Map<String, dynamic> askQuestionStatus) async {
    _askQuestionStatus = askQuestionStatus;
    if (_askQuestionStatus['success'] == 0) {
      _status = Status.failed;
    } else {
      _status = Status.success;
    }
    notifyListeners();
  }


  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }


  updateAskQuestion(String question) async {
    try {
      _status = Status.loading;
      _setAskStatus(await _askService.register(
          question, _userDetails.getId().toString()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}