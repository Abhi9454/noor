import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:noor/models/book_model.dart';
import 'package:noor/models/calender_model.dart';
import 'package:noor/models/product_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class HomePageService {
  final HttpService httpService = HttpService();

  Future<String> fetchDailyQuiz() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().dailyQuizApiUrl, 'POST');
      return (response.data.toString());
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
