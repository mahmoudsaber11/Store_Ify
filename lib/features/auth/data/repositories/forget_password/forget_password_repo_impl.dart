import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/features/auth/data/repositories/forget_password/forget_password_repo.dart';

class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final DioConsumer dioConsumer;

  const ForgetPasswordRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, dynamic>> checkEmailRepo({
    required String email,
  }) async {
    try {
      final response = await dioConsumer
          .patchData(EndPoints.forgetPassword, data: {"email": email});
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
