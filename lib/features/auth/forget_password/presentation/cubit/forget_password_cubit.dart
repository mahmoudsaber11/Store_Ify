import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/auth/forget_password/data/repositories/check_email_repo.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.checkEmailRepo}) : super((InitialCheckEmailState()));
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  final CheckEmailRepo checkEmailRepo;

  void checkEmail({
    required String email,
  }) {
    emit(LoadingCheckEmailState());
    checkEmailRepo.checkEmailRepo(email: email).then((value) {
      value.fold((failure) {
        emit(ErrorCheckEmailState(failure.errMessage.toString()));
      }, (message) {
        emit(SuccessCheckEmailState(message.toString()));
      });
    });
  }
}
