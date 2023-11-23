import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/repositories/verification/verification_repo.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit({required this.verificationRepo})
      : super((InitialCheckVerificationState()));

  final VerificationRepo verificationRepo;

  void otpVerification({required String email, required String forgetCode}) {
    emit(LoadingVerificationState());
    verificationRepo
        .otpVerification(email: email, forgetCode: forgetCode)
        .then((value) {
      value.fold((failure) {
        emit(ErrorVerificationState(failure.errMessage.toString()));
      }, (verify) {
        emit(SuccessVerificationState(verify.toString()));
      });
    });
  }
}
