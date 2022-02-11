import 'package:flutter/cupertino.dart';
import 'package:noor/models/mahdavia_model.dart';
import 'package:noor/services/mahdavia_service.dart';
import '../helpers/error_handler.dart';
import '../helpers/enum.dart';

class MahdaviaViewModel extends ChangeNotifier{
  final MahdaviaService _mahdaviaService = MahdaviaService();
  Status _status = Status.init;

  Status get status => _status;


  late List<MahdaviaModel> _mahdaviaDetails;

  List<MahdaviaModel> get mahdaviaDetails => _mahdaviaDetails;

  Future<void> _setMahdavia(List<MahdaviaModel> mahdaviaDetails) async {
    _mahdaviaDetails = mahdaviaDetails;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetchMahdavia() async {
    try {
      _status = Status.loading;
      _setMahdavia(await _mahdaviaService.fetch());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}