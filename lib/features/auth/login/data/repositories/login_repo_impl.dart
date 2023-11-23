import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/features/auth/login/data/repositories/login_repo.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';
import 'package:store_ify/core/api/dio_consumer.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;

  LoginRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, UserModel>> userLoginIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioConsumer.postData(EndPoints.login,
          data: {"email": email, "password": password});
      final UserModel user = UserModel.fromJson(response);
      return right(user);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
