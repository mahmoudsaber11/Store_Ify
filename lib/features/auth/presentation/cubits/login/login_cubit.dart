import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_ify/features/auth/data/models/user_model.dart';
import 'package:store_ify/features/auth/data/repositories/login/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepo}) : super(const LoginInitial());

  final LoginRepo loginRepo;

  void userSignIn({
    required String email,
    required String password,
  }) {
    emit(const LoginLoading());

    loginRepo
        .userLoginIn(
      email: email,
      password: password,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignInError(error: failure.errMessage.toString()));
        },
        (user) {
          emit(LoginSuccess(user: user));
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
