import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:noor/models/masjid_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class MasjidLocationService {
  final HttpService httpService = HttpService();

  Future<List<MasjidModel>> fetchMasjid() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().mashjidLocationPage, 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<MasjidModel> _list = res
          .map<MasjidModel>((json) => MasjidModel.fromJson(json))
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
