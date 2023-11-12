import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:store_ify/features/auth/sign_up/domain/repositories/register_repo.dart';
import 'package:store_ify/core/api/end_point.dart';
import 'package:store_ify/core/errors/failures.dart';
import 'package:store_ify/core/models/user_model.dart';
import 'package:store_ify/core/api/api_service.dart';

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

  @override
  Future<Either<Exception, UserCredential>> userSignUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return right(
          await FirebaseAuth.instance.signInWithCredential(credential));
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
