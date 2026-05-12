import 'package:dio/dio.dart';

class Apiservice {
  final String baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;
  Apiservice(this.dio);

  // get methods
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
