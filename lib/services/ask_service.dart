import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class AskService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> register(String question, String userId) async {
    try {
      final Map<String, dynamic>  map = <String, dynamic>{
        'question' : question,
        'userid': userId,
      };
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/ask.php', 'POST', data: map);
      return response.data as Map<String,dynamic>;
    } on DioError catch (error) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout) {
        throw ShowError('Server timeout ');
      } else if (error.type == DioErrorType.other) {
        throw ShowError('No Internet connection...');
      } else {
        throw ShowError('Something went wrong');
      }
    }
  }
}