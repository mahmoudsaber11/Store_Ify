abstract class ResetPasswordState {}

class InitialResetPasswordState extends ResetPasswordState {}

class LoadingResetPasswordState extends ResetPasswordState {}

class SuccessResetPasswordState extends ResetPasswordState {
  final String message;

  SuccessResetPasswordState(this.message);
}

class ErrorResetPasswordState extends ResetPasswordState {
  final String errorMessage;

  ErrorResetPasswordState(this.errorMessage);
}
