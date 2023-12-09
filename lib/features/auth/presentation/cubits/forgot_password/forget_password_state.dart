part of 'forget_password_cubit.dart';

abstract class ForgotPasswordState extends Equatable {
  const ForgotPasswordState();

  @override
  List<Object?> get props => [];
}

class InitialCheckEmailState extends ForgotPasswordState {
  const InitialCheckEmailState();
}

class LoadingCheckEmailState extends ForgotPasswordState {
  const LoadingCheckEmailState();
}

class SuccessCheckEmailState extends ForgotPasswordState {
  final String message;

  const SuccessCheckEmailState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorCheckEmailState extends ForgotPasswordState {
  final String errorMessage;

  const ErrorCheckEmailState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
