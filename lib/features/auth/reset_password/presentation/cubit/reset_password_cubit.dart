import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/reset_password/data/repositories/reset_password_repo.dart';
import 'package:store_ify/features/auth/reset_password/presentation/cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit({required this.resetPasswordRepo})
      : super((InitialResetPasswordState()));

  final ResetPasswordRepo resetPasswordRepo;

  void resetPassword(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    emit(LoadingResetPasswordState());
    await resetPasswordRepo
        .resetPassword(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    )
        .then((value) {
      value.fold((failure) {
        emit(ErrorResetPasswordState(failure.errMessage.toString()));
      }, (message) {
        emit(SuccessResetPasswordState(message.toString()));
      });
    });
  }
}
