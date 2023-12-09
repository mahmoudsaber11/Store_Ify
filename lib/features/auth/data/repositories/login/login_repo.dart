import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/auth/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> userLoginIn({
    required String email,
    required String password,
  });
}
