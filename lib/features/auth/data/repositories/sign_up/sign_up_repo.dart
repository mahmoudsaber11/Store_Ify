import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/auth/data/models/user_model.dart';

abstract class SignUpRepo {
  Future<Either<Failure, User>> userSingUp({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
