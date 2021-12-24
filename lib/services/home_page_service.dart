import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:noor/models/book_model.dart';
import 'package:noor/models/calender_model.dart';
import 'package:noor/models/product_model.dart';
import 'package:noor/models/quiz_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class HomePageService {
  final HttpService httpService = HttpService();

  Future<List<QuizModel>> fetchDailyQuiz() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().dailyQuizApiUrl, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<QuizModel> _list = res
          .map<QuizModel>((json) => QuizModel.fromJson(json))
          .toList();
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
