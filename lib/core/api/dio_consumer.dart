import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:store_ify/core/api/app_interceptors.dart';
import 'package:store_ify/service_locator.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.interceptors.add(serviceLocator.get<AppInterceptors>());

    if (kDebugMode) {
      dio.interceptors.add(serviceLocator.get<LogInterceptor>());
    }
  }

  Future<dynamic> getData(
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

  Future<dynamic> patchData(
    String path, {
    required Map<String, dynamic> data,
  }) async {
    final Response response = await dio.patch(path, data: data);

    return response.data;
  }
}
