import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/masjid_model.dart';
import 'package:noor/services/masjid_location_service.dart';

class MasjidLocationViewModel extends ChangeNotifier{
  final MasjidLocationService _masjidLocationService = MasjidLocationService();
  Status _status = Status.init;

  Status get status => _status;


  late List<MasjidModel> _masjidDetails;

  List<MasjidModel> get masjidDetails => _masjidDetails;

  Future<void> _setMasjid(List<MasjidModel> masjidDetails) async {
    _masjidDetails = masjidDetails;
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
      _setMasjid(await _masjidLocationService.fetchMasjid());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}