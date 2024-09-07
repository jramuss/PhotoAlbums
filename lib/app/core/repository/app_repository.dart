import 'package:dio/dio.dart';
import 'package:photo_albums/app/core/repository/app_exception.dart';

class AppRepository {
  static String baseUrl = "https://jsonplaceholder.typicode.com";

  static Dio? _dio;

  static Dio? getDio() {
    _dio ??= Dio();

    return _dio;
  }


  static dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
      case 422:
        return response;
      case 415:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.data.toString());
      case 404:
        throw UnauthorisedException(response.data.toString());
      case 500:
        throw BadRequestException(response.toString());
      default:
        throw FetchDataException('Error occured while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }

}
