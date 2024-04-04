// ignore_for_file: unused_import, avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://192.168.1.5:8000/api/';
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }

  Future<Map<String,dynamic>> post({
    required String endPoint,
    required dynamic body,
  }) async {
    // print('=======baseuser : $_baseUrl$endPoint=========');
    // print('=====body : $body=========');
    var response = await _dio.post(
      '$_baseUrl$endPoint',
      data: body,
    );
    if (response.statusCode == 200) {
      print(
          '==========status code : ${response.statusMessage}======================');
      print('==========data before decode :${response.data}=================');
      // Map<String, dynamic> data = jsonDecode(response.data);
      // print('==========data after decode :$data=================');
      return response.data;
    } else {
      throw Exception(
          'there is an exception with status code ${response.statusCode} and response body is ${response.statusMessage}');
    }
    // print('====data:====${response.data}======');
  }
}
