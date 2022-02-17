import 'package:dio/dio.dart';
import 'package:noor/models/dua_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class DuaService {
  final HttpService httpService = HttpService();

  Future<List<DuaModel>> fetchDua() async {
    try {
      final Response<dynamic> response =
          await httpService.requestSource(AppConfig().duaApiLink, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<DuaModel> _list =
          res.map<DuaModel>((json) => DuaModel.fromJson(json)).toList();
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