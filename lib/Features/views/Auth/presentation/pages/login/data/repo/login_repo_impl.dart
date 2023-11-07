import 'package:dartz/dartz.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/data/repo/login_repo.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';
import 'package:store_ify/core/utils/api_service.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);

  @override
  Future<Either<Failure, UserModel>> userLoginIn(
      {required String email, required String password}) async {
    try {
      final response = await apiService.postData(EndPoints.login,
          data: {"email": email, "password": password});
      final UserModel user = UserModel.fromJson(response);
      return right(user);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
