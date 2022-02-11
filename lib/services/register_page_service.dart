import 'package:dio/dio.dart';
import '../helpers/error_handler.dart';
import '../config.dart';
import '../helpers/http_service.dart';

class RegisterService {
  final HttpService httpService = HttpService();


  Future<Map<String, dynamic>> register(String name, String userDob, String email,String userPassword, String userAhle,String userMurshidName, String userMasjidName) async {
    try {
      final Map<String, dynamic>  map = <String, dynamic>{
        'fullname' : name,
        'dob': userDob,
        'emailid' : email,
        'password' : userPassword,
        'ahle' : userAhle,
        'murshidname' : userMurshidName,
        'masjidname' : userMasjidName,
        'status' : 'Approve',
        'usertype' : 'User'
      };
      final Response<dynamic> response =
      await httpService.requestSource(
          AppConfig().apiUrl + '/registration.php', 'POST', data: map);
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