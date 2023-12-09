import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/auth/data/models/user.dart';

abstract class LoginRepo {
  Future<Either<Failure, User>> userLogin({
    required String email,
    required String password,
  });
}
