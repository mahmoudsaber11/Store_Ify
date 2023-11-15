import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/features/auth/verification/data/repositories/verification_repo.dart';

class VerificationRepoImpl implements VerificationRepo {
  final DioConsumer dioConsumer;

  VerificationRepoImpl({required this.dioConsumer});
  @override
  Future<Either<Failure, dynamic>> otpVerification({
    required String email,
    required String forgetCode,
  }) async {
    try {
      final response = await dioConsumer.postData(EndPoints.verfiyCode,
          data: {"email": email, "forgetCode": forgetCode});
      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
