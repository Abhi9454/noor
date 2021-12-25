
import 'package:dio/dio.dart';
import 'package:noor/models/book_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class BookPageService {
  final HttpService httpService = HttpService();

  Future<List<BookModel>> fetchBooks() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/book.php', 'POST');
      var json = response.data as Map<String,dynamic>;
      var res = json['data'] as List;
      print(res[0].toString());
      List<BookModel> _list = res.map<BookModel>((json) => BookModel.fromJson(json)).toList();
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
