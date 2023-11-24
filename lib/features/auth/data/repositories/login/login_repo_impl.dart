import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/core/network/network_info.dart';
import 'package:store_ify/core/utils/app_strings.dart';
import 'package:store_ify/features/auth/data/repositories/login/login_repo.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/features/auth/data/models/user_model.dart';
import 'package:store_ify/core/api/dio_consumer.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;
  final NetworkInfo networkInfo;

  const LoginRepoImpl({required this.networkInfo, required this.dioConsumer});

  @override
  Future<Either<Failure, UserModel>> userLoginIn({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
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
    } else {
      return Left(ServerFailure(AppStrings.noInternet));
    }
  }
}
