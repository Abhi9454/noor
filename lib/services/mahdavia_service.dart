import 'package:dio/dio.dart';
import 'package:noor/models/masjid_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class MahdaviaService {
  final HttpService httpService = HttpService();

  Future<List<MahdaviaModel>> fetch() async {
    try {
      final Response<dynamic> response = await httpService.requestSource(
          AppConfig().apiUrl + '/mahdavia.php', 'POST');
      var json = response.data as Map<String, dynamic>;
      var res = json['data'] as List;
      List<MahdaviaModel> _list = res
          .map<MahdaviaModel>((json) => MahdaviaModel.fromJson(json))
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
