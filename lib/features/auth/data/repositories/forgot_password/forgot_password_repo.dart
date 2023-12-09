import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, dynamic>> checkEmailRepo({
    required String email,
  });
}
