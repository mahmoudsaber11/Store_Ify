import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/data/repo/register_repo.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';
import 'package:store_ify/core/utils/api_service.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiService apiService;

  RegisterRepoImpl(this.apiService);
  @override
  Future<Either<Failure, UserModel>> userSingUp(
      {required String userName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      final response = await apiService.postData(
        EndPoints.register,
        data: {
          "userName": userName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword
        },
      );
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
