import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/features/auth/data/repositories/sign_up/sign_up_repo.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_state.dart';

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
          serviceLocator
              .get<CacheHelper>()
              .saveData(key: 'uid', value: Helper.uId);
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