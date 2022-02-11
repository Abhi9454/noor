import 'package:dio/dio.dart';
import 'package:noor/models/news_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class NewsService {
  final HttpService httpService = HttpService();

  Future<List<NewsModel>> fetchNews() async {
    try {
      final Response<dynamic> response =
          await httpService.requestSource(AppConfig().newsApiLink, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<NewsModel> _list =
          res.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
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
