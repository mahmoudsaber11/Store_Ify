import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/auth/forget_password/data/repositories/check_email_repo.dart';
import 'package:store_ify/Features/auth/forget_password/presentation/cubit/check_email_state.dart';

class CheckEmailCubit extends Cubit<CheckEmailState> {
  CheckEmailCubit(this.checkEmailRepo) : super((InitialCheckEmailState()));
  static CheckEmailCubit get(context) => BlocProvider.of(context);

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
