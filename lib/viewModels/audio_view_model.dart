import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/audio_model.dart';
import 'package:noor/services/audio_service.dart';

class AudioViewModel extends ChangeNotifier{
  final AudioService _audioService = AudioService();
  Status _status = Status.init;
  bool isPlaying = false;

  Status get status => _status;


  late List<AudioModel> _audioList;

  List<AudioModel> get audioList => _audioList;

  Future<void> _setAudio(List<AudioModel> audioList) async {
    _audioList = audioList;
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
      _setAudio(await _audioService.fetchAudio());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  updatePlaying(bool playing){
    isPlaying = playing;
    notifyListeners();
  }
}