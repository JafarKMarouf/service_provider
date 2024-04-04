import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.5:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    required dynamic body,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: body,
    );
    return response.data;
  }
}
