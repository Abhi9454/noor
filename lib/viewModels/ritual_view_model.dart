import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/rituals_model.dart';
import 'package:noor/services/ritual_service.dart';

class RitualViewModel extends ChangeNotifier {
  final RitualService _ritualService = RitualService();
  Status _status = Status.init;

  Status get status => _status;

  late List<RitualModel> _ritualList;

  List<RitualModel> get ritualList => _ritualList;

  Future<void> _setRitual(List<RitualModel> ritualList) async {
    _ritualList = ritualList;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetch() async {
    try {
      _status = Status.loading;
      _setRitual(await _ritualService.fetchRitual());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
