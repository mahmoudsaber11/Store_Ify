import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';

abstract class CheckEmailRepo {
  Future<Either<Failure, UserModel>> checkEmailRepo({
    required String message,
  });
}
