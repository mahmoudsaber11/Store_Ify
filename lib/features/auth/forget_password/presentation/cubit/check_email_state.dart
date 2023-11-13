abstract class CheckEmailState {}

class InitialCheckEmailState extends CheckEmailState {}

class LoadingCheckEmailState extends CheckEmailState {}

class SuccessCheckEmailState extends CheckEmailState {}

class ErrorCheckEmailState extends CheckEmailState {
  final String errorMessage;

  ErrorCheckEmailState(this.errorMessage);
}
