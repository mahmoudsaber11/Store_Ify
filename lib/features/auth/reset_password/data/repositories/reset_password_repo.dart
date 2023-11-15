import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';

abstract class ResetPasswordRepo {
  Future<Either<Failure, dynamic>> otpVerification(
      {required String email,
      required String password,
      required String confirmPassword});
}
