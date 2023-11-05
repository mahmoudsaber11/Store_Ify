import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getData(
    String path, {
    required Map<String, dynamic>? queryParameters,
  }) async {
    Response response = await dio.get(path, queryParameters: queryParameters);
    return jsonDecode(response.data);
  }

  Future<Map<String, dynamic>> postData(String path,
      {Map<String, dynamic>? queryParameters,
      required Map<String, dynamic> data}) async {
    Response response =
        await dio.get(path, queryParameters: queryParameters, data: data);
    return jsonDecode(response.data);
  }
}
