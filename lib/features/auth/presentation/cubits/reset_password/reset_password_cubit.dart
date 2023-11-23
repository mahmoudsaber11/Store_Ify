import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/features/auth/data/repositories/reset_password/reset_password_repo.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_state.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';

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
        serviceLocator
            .get<CacheHelper>()
            .saveData(key: 'uid', value: Helper.uId);
        emit(SuccessResetPasswordState(message.toString()));
      });
    });
  }
}
