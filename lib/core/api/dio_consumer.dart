import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:store_ify/core/api/app_interceptors.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/api/status_code.dart';
import 'package:store_ify/service_locator.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      HttpClient client = HttpClient();
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCodes.internalServerError;
      };

    dio.interceptors.add(serviceLocator.get<AppInterceptors>());

    if (kDebugMode) {
      dio.interceptors.add(serviceLocator.get<LogInterceptor>());
    }
  }

  Future<Map<String, dynamic>> getData(
    String path,
  ) async {
    final Response response = await dio.get(
      path,
    );
    return response.data;
  }

  Future<dynamic> postData(
    String path, {
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async {
    final Response response = await dio.post(
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
    final Response response = await dio.patch(path, data: data);

    return response.data;
  }
}
