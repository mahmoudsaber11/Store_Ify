import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> userLoginIn({
    required String email,
    required String password,
  });
}
