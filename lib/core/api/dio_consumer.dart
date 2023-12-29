import 'package:dio/dio.dart';

class DioConsumer {
  final Dio dio;

  DioConsumer({required this.dio});
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
