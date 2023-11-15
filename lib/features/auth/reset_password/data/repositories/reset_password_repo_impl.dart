import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/features/auth/reset_password/data/repositories/reset_password_repo.dart';

class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final DioConsumer dioConsumer;

  ResetPasswordRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, dynamic>> resetPassword(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await dioConsumer.patchData(
        EndPoints.resetPassword,
        data: {
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword
        },
      );
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
