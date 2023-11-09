import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/data/repo/login_repo.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_state.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';
import 'package:store_ify/core/utils/constant.dart';

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
          CacheHelper.saveData(key: 'uid', value: uId);
          emit(SignInSuccessState(
            userModel: user,
            user.data.id,
          ));
        },
      );
    });
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    emit(LoginChangePasswordVisibility(isPassword: isPassword));
  }
}
