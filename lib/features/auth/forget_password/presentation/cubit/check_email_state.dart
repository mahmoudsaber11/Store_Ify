abstract class CheckEmailState {}

class InitialCheckEmailState extends CheckEmailState {}

class LoadingCheckEmailState extends CheckEmailState {}

class SuccessCheckEmailState extends CheckEmailState {
  final String message;

  SuccessCheckEmailState(this.message);
}

class ErrorCheckEmailState extends CheckEmailState {
  final String errorMessage;

  ErrorCheckEmailState(this.errorMessage);
}
