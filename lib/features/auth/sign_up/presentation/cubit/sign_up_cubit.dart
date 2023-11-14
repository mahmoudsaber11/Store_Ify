import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/sign_up/data/repositories/sign_up_repo.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.registerRepo}) : super(SignUpInitial());

  final SignUpRepo registerRepo;

  void userSignUP({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(SignUpLoadingState());
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
          emit(SignUpErrorState(failure.errMessage.toString()));
        },
        (user) {
          emit(SignUpSuccessState(
            userModel: user,
          ));
        },
      );
    });
  }

  void signUpWithGoogle() {
    emit(SignUpLoadingState());
    registerRepo.userSignUpWithGoogle().then((value) {
      value.fold(
        (failure) {
          SignUpWithGoogleErrorState(error: failure.toString());
        },
        (user) => emit(SignUpWithGoogleSuccessState(user.user!.uid)),
      );
    });
  }

  bool isPassword = true;

  void switchPassVisibility() {
    isPassword = !isPassword;
    emit(SignUpChangePasswordVisibility(isPassword: isPassword));
  }
}
