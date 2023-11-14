import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';

abstract class VerificationRepo {
  Future<Either<Failure, UserModel>> otpVerification(
      {required String email, required String forgetCode});
}
