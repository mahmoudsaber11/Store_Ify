import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/domain/repositories/register_repo.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.registerRepo) : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  final RegisterRepo registerRepo;

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

  bool isPassword = true;

  void switchPassVisibility() {
    isPassword = !isPassword;
    emit(SignUpChangePasswordVisibility(isPassword: isPassword));
  }
}
