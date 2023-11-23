abstract class ForgetPasswordState {}

class InitialCheckEmailState extends ForgetPasswordState {}

class LoadingCheckEmailState extends ForgetPasswordState {}

class SuccessCheckEmailState extends ForgetPasswordState {
  final String message;

  SuccessCheckEmailState(this.message);
}

class ErrorCheckEmailState extends ForgetPasswordState {
  final String errorMessage;

  ErrorCheckEmailState(this.errorMessage);
}
