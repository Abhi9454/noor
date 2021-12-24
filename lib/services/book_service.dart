import 'dart:convert';

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
          AppConfig().bookApiLink, 'POST');
      var _books = jsonDecode(response.data);
      return (_books['data']);
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
