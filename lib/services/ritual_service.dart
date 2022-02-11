import 'package:dio/dio.dart';
import 'package:noor/models/rituals_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class RitualService {
  final HttpService httpService = HttpService();

  Future<List<RitualModel>> fetchRitual() async {
    try {
      final Response<dynamic> response =
      await httpService.requestSource(AppConfig().ritualApiLink, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<RitualModel> _list =
      res.map<RitualModel>((json) => RitualModel.fromJson(json)).toList();
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
