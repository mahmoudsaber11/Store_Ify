import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/Features/auth/forget_password/data/repositories/check_email_repo.dart';
import 'package:store_ify/core/api/dio_consumer.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/errors/server_failure.dart';
import 'package:store_ify/core/models/user_model.dart';

class CheckEmailRepoImpl implements CheckEmailRepo {
  final DioConsumer apiService;

  CheckEmailRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserModel>> checkEmailRepo(
      {required String message}) async {
    try {
      final response = await apiService
          .patchData(EndPoints.forgetPassword, data: {"message": message});
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
