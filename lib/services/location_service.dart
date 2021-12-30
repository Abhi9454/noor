import 'dart:convert';

import 'package:noor/helpers/error_handler.dart';
import 'package:noor/helpers/http_service.dart';
import 'package:noor/models/location_model.dart';
import 'package:dio/dio.dart';


class LocationService{

  final HttpService httpService = HttpService();

  Future<Welcome> fetchLocationDetails(String date,String latitude, String longitude) async {
    try {
      String queryString = 'https://api.aladhan.com/v1/timings/'+date+'?latitude='+latitude+'&longitude='+longitude;
      final Response<dynamic> response = await httpService.requestSource(
         queryString , 'GET');
      final json = welcomeFromJson(jsonEncode(response.data));
      return json;
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