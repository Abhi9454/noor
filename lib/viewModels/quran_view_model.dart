import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/quran_model.dart';
import 'package:noor/services/quran_service.dart';

class QuranViewModel extends ChangeNotifier {
  final QuranService _quranService = QuranService();
  Status _status = Status.init;

  Status get status => _status;

  late List<QuranModel> _quranList;

  List<QuranModel> get quranList => _quranList;

  Future<void> _setQuran(List<QuranModel> quranList) async {
    _quranList = quranList;
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
      _setQuran(await _quranService.fetchQuran());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
