import 'package:flutter/cupertino.dart';
import '../helpers/error_handler.dart';
import '../models/calender_model.dart';
import '../helpers/enum.dart';
import '../services/calender_page_service.dart';

class CalenderViewModel extends ChangeNotifier{
  final CalenderPageService _calenderPageService = CalenderPageService();
  Status _status = Status.init;

  Status get status => _status;


  late List<CalenderModel> _calenderDetails;

  List<CalenderModel> get calenderDetails => _calenderDetails;

  Future<void> _setUserDetails(List<CalenderModel> calenderDetails) async {
    _calenderDetails = calenderDetails;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetchCalender() async {
    try {
      _status = Status.loading;
      _setUserDetails(await _calenderPageService.fetch());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}