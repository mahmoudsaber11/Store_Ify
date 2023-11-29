import 'dart:convert';

import 'package:dio/dio.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer(this.dio);

  Future<Map<String, dynamic>> getData(
    String path,
    // required Map<String, dynamic>? queryParameters,
  ) async {
    Response response = await dio.get(
      path,
    );
    return jsonDecode(response.data);
  }

  Future<dynamic> postData(
    String path, {
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
    );
    return response.data;
  }

  Future patchData(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    Response response = await dio.patch(path, data: data);
    return response.data;
  }
}
