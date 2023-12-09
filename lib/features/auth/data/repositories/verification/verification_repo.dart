import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';

abstract class VerificationRepo {
  Future<Either<Failure, dynamic>> otpVerification({
    required String email,
    required String forgetCode,
  });
}
