import 'package:dio/dio.dart';

class HttpService {
  Dio dio = Dio();

  Future<Response<dynamic>> requestSource(String url, String method,
      {Map<String, dynamic>? data, FormData? formData}) async {
    return dio.request(url,
        data: data ?? formData,
        options: Options(
          method: method,
        ));
  }
}