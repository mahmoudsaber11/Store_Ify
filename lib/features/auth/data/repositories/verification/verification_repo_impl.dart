import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/core/network/network_info.dart';
import 'package:store_ify/core/utils/app_strings.dart';
import 'package:store_ify/features/auth/data/entities/verification_params.dart';
import 'package:store_ify/features/auth/data/repositories/verification/verification_repo.dart';

class VerificationRepoImpl implements VerificationRepo {
  final DioConsumer dioConsumer;
  final NetworkInfo networkInfo;

  const VerificationRepoImpl({
    required this.networkInfo,
    required this.dioConsumer,
  });

  @override
  Future<Either<Failure, dynamic>> otpVerification({
    required VerificationParams verificationParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dioConsumer.postData(
          EndPoints.verifyCode,
          data: {
            "email": verificationParams.email,
            "forgetCode": verificationParams.forgetCode,
          },
        );
        return right(response);
      } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioException(e));
        }
        return left(ServerFailure(e.toString()));
      }
    } else {
      return Left(ServerFailure(AppStrings.noInternet));
    }
  }
}
