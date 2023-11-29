import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/data/repositories/verification/verification_repo.dart';

part 'verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit({required this.verificationRepo})
      : super((const InitialCheckVerificationState()));

  final VerificationRepo verificationRepo;

  void otpVerification({required String email, required String forgetCode}) {
    emit(const LoadingVerificationState());
    verificationRepo
        .otpVerification(email: email, forgetCode: forgetCode)
        .then((value) {
      value.fold((failure) {
        emit(ErrorVerificationState(
            errorMessage: failure.errMessage.toString()));
      }, (verify) {
        emit(SuccessVerificationState(message: verify.toString()));
      });
    });
  }
}
