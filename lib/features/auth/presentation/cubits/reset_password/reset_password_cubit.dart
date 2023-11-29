import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/repositories/reset_password/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo})
      : super((const InitialResetPasswordState()));

  final ResetPasswordRepo resetPasswordRepo;

  void resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const LoadingResetPasswordState());
    await resetPasswordRepo
        .resetPassword(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    )
        .then((value) {
      value.fold((failure) {
        emit(ErrorResetPasswordState(
            errorMessage: failure.errMessage.toString()));
      }, (message) {
        emit(SuccessResetPasswordState(message: message.toString()));
      });
    });
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    emit(ResetChangePasswordVisibility(isPassword: isPassword));
  }
}
