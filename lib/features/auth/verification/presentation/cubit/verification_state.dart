import 'package:store_ify/core/models/user_model.dart';

abstract class VerificationState {}

class InitialCheckVerificationState extends VerificationState {}

class LoadingVerificationState extends VerificationState {}

class SuccessVerificationState extends VerificationState {
  final UserModel userModel;

  SuccessVerificationState({required this.userModel});
  // final String message;

  // SuccessVerificationState(this.message);
}

class ErrorVerificationState extends VerificationState {
  final String errorMessage;

  ErrorVerificationState(this.errorMessage);
}
