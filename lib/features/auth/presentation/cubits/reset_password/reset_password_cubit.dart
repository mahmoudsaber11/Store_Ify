import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/entities/reset_password_params.dart';
import 'package:store_ify/features/auth/data/repositories/reset_password/reset_password_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo})
      : super((const ResetPasswordInitial()));

  final ResetPasswordRepo resetPasswordRepo;

  void resetPassword({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(const ResetPasswordLoading());

    resetPasswordRepo
        .resetPassword(
      resetPasswordParams: ResetPasswordParams(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    )
        .then(
      (value) {
        value.fold((failure) {
          emit(ResetPasswordError(errorMessage: failure.errMessage.toString()));
        }, (message) {
          emit(ResetPasswordSuccess(message: message.toString()));
        });
      },
    );
  }

  bool isPassword = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;

    emit(ChangeVisibility(isPassword: isPassword));
  }
}
