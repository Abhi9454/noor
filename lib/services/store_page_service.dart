import 'package:dio/dio.dart';
import 'package:noor/models/product_model.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class StorePageService {
  final HttpService httpService = HttpService();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final Response<dynamic> response =
          await httpService.requestSource(AppConfig().productsApiLink, 'POST');
      var json = response.data as Map<String,dynamic>;
      var res = json['data'] as List;
      List<ProductModel> _list =
          res.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
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
