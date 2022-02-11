import 'package:dio/dio.dart';
import 'package:noor/models/audio_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AudioService {
  final HttpService httpService = HttpService();

  Future<List<AudioModel>> fetchAudio() async {
    try {
      final Response<dynamic> response =
          await httpService.requestSource(AppConfig().audioApiLink, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<AudioModel> _list =
          res.map<AudioModel>((json) => AudioModel.fromJson(json)).toList();
      return _list;
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}
