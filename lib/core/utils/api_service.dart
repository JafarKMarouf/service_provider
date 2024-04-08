// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.6:8000/api/';
  final Dio _dio;
  static var storage = const FlutterSecureStorage();
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    String? token = await getToken();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';
    //  print('$_baseUrl$endPoint');
    //   print(_dio.options.headers);
    var response = await _dio.get(
      '$_baseUrl$endPoint',
    );
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    String? token = await getToken();

    await getUserDetails();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';

    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: body,
    );
    return response.data;
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> logout() async {
    await storage.delete(key: 'token');
  }

  static Future<void> storeUserDetails(String username) async {
    await storage.write(key: 'username', value: username);
  }

  static Future<String?> getUserDetails() async {
    return await storage.read(key: 'username');
  }
}
