import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/features/auth/login/doman/repositories/login_repo.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_state.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';
import 'package:store_ify/service_locator.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  final LoginRepo loginRepo;

  void userSignIn({
    required String email,
    required String password,
  }) {
    emit(SignInLoadingState());

    loginRepo
        .userLoginIn(
      email: email,
      password: password,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignInErrorState(failure.errMessage.toString()));
        },
        (user) {
          serviceLocator
              .get<CacheHelper>()
              .saveData(key: 'uid', value: Helper.uId);
          emit(SignInSuccessState(
            userModel: user,
            user.data.id,
          ));
        },
      );
    });
  }

  void signInWithGoogle() {
    emit(SignInWithGoogleLoadingState());
    loginRepo.loginWithGoogle().then((value) {
      value.fold(
        (failure) {
          SignInWithGoogleErrorState(error: failure.toString());
        },
        (user) => emit(SignInWithGoogleSuccessState(user.user!.uid)),
      );
    });
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    emit(LoginChangePasswordVisibility(isPassword: isPassword));
  }
}
