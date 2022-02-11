import 'package:flutter/cupertino.dart';
import 'package:noor/helpers/enum.dart';
import 'package:noor/helpers/error_handler.dart';
import 'package:noor/models/video_model.dart';
import 'package:noor/services/video_service.dart';

class VideoViewModel extends ChangeNotifier{
  final VideoService _videoService = VideoService();
  Status _status = Status.init;

  Status get status => _status;


  late List<VideoModel> _videoList;

  List<VideoModel> get videoList => _videoList;

  Future<void> _setVideo(List<VideoModel> videoList) async {
    _videoList = videoList;
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
      _setVideo(await _videoService.fetchVideo());
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}