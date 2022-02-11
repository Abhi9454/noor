import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/dua_model.dart';
import 'package:noor/services/dua_service.dart';

class DuaViewModel extends ChangeNotifier {
  final DuaService _duaService = DuaService();
  Status _status = Status.init;

  Status get status => _status;

  late List<DuaModel> _duaList;

  List<DuaModel> get duaList => _duaList;

  Future<void> _setDua(List<DuaModel> duaList) async {
    _duaList = duaList;
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
      _setDua(await _duaService.fetchDua());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
