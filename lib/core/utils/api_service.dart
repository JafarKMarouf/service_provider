import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.5:8000/api/';
  final Dio _dio;
  static var storage = const FlutterSecureStorage();
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    String? token = await getToken();
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
      // print('===========stored token: $token=============');
    }
    var response = await _dio.get(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    String? token = await getToken();
    if (token != null) {
      headers.addAll(
        {
          'Authorization': 'Bearer ${getToken()}',
        },
      );
      // print('===========stored token: $token=============');
    }
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: body,
      queryParameters: headers,
    );
    return response.data;
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

 static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }
}
