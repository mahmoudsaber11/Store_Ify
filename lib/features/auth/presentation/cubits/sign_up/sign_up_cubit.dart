import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/models/user_model.dart';
import 'package:store_ify/features/auth/data/repositories/sign_up/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.registerRepo}) : super(const SignUpInitial());

  final SignUpRepo registerRepo;

  void userSignUP({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(const SignUpLoadingState());
    registerRepo
        .userSingUp(
      userName: userName,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    )
        .then((value) {
      value.fold(
        (failure) {
          emit(SignUpErrorState(error: failure.errMessage.toString()));
        },
        (user) {
          emit(SignUpSuccessState(userModel: user));
        },
      );
    });
  }

  bool isPassword = true;
  bool isConfirmPassVisible = true;

  void switchPassVisibility() {
    isPassword = !isPassword;
    emit(SignUpChangePasswordVisibility(isPassword: isPassword));
  }

  void switchConfirmPassVisibility() {
    isConfirmPassVisible = !isConfirmPassVisible;
    emit(SignUpChangePasswordVisibility(isPassword: isConfirmPassVisible));
  }
}
