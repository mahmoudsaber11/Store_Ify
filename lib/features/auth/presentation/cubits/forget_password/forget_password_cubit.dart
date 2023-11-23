import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/repositories/forget_password/forget_password_repo.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetPasswordRepo})
      : super((InitialCheckEmailState()));

  final ForgetPasswordRepo forgetPasswordRepo;

  void checkEmail({
    required String email,
  }) {
    emit(LoadingCheckEmailState());
    forgetPasswordRepo.checkEmailRepo(email: email).then((value) {
      value.fold((failure) {
        emit(ErrorCheckEmailState(failure.errMessage.toString()));
      }, (message) {
        emit(SuccessCheckEmailState(message.toString()));
      });
    });
  }
}
