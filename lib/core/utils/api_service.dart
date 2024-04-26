// ignore_for_file: unused_import

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.7:8000/api/';
  // final _baseUrl = 'http://192.168.54.128:8000/api/';

  final Dio _dio;
  static var storage = const FlutterSecureStorage();
  ApiService(this._dio);

  Future<Map<String, dynamic>> get({
    required String endPoint,
    String? id,
  }) async {
    String? token = await getToken();
    _dio.options.headers['Accept'] = 'application/json';
    _dio.options.headers['Authorization'] = 'Bearer $token';

    String uri = id == null ? '$_baseUrl$endPoint' : '$_baseUrl$endPoint$id';
    var response = await _dio.get(
      uri,
    );
    // return response.
    return response.data;
  }

  Future<Map<String, dynamic>> post({
    required String endPoint,
    dynamic body,
  }) async {
    String? token = await getToken();
    // await getUserDetails();
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

  Future<void> removeToken() async {
    await storage.delete(key: 'token');
  }

  static Future<void> storeUserId(String userId) async {
    await storage.write(key: 'userId', value: userId);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: 'userId');
  }

  static Future<void> storeUserName(String userName) async {
    await storage.write(key: 'userName', value: userName);
  }

  static Future<String?> getUserName() async {
    return await storage.read(key: 'userName');
  }
}
