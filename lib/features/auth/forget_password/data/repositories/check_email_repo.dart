import 'package:dartz/dartz.dart';
import 'package:store_ify/core/errors/failures.dart';

abstract class CheckEmailRepo {
  Future<Either<Failure, String>> checkEmailRepo({
    required String email,
  });
}
