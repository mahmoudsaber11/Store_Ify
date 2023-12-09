import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/repositories/forgot_password/forgot_password_repo.dart';

part 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.forgetPasswordRepo})
      : super((const InitialCheckEmailState()));

  final ForgotPasswordRepo forgetPasswordRepo;

  void checkEmail({
    required String email,
  }) {
    emit(const LoadingCheckEmailState());
    forgetPasswordRepo.checkEmailRepo(email: email).then((value) {
      value.fold((failure) {
        emit(ErrorCheckEmailState(errorMessage: failure.errMessage.toString()));
      }, (message) {
        emit(SuccessCheckEmailState(message: message.toString()));
      });
    });
  }
}
