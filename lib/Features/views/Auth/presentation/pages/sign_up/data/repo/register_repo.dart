import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, UserModel>> userSingUp(
      {required String userName,
      required String email,
      required String password,
      required String confirmPassword});
}
