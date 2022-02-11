import 'package:dio/dio.dart';
import 'package:noor/models/quran_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class QuranService {
  final HttpService httpService = HttpService();

  Future<List<QuranModel>> fetchQuran() async {
    try {
      final Response<dynamic> response =
          await httpService.requestSource(AppConfig().quranApiLink, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<QuranModel> _list =
          res.map<QuranModel>((json) => QuranModel.fromJson(json)).toList();
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
