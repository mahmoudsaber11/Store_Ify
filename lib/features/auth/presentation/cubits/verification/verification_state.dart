abstract class VerificationState {}

class InitialCheckVerificationState extends VerificationState {}

class LoadingVerificationState extends VerificationState {}

class SuccessVerificationState extends VerificationState {
  final String message;

  SuccessVerificationState(this.message);
}

class ErrorVerificationState extends VerificationState {
  final String errorMessage;

  ErrorVerificationState(this.errorMessage);
}
