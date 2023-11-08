import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getData(
    String url, {
    required Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(url, queryParameters: queryParameters);
    return jsonDecode(response.data);
  }

  Future<dynamic> postData(String url,
      {Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    Response response = await dio.post(
      url,
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }
}
