part of 'forget_password_cubit.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object?> get props => [];
}

class InitialCheckEmailState extends ForgetPasswordState {
  const InitialCheckEmailState();
}

class LoadingCheckEmailState extends ForgetPasswordState {
  const LoadingCheckEmailState();
}

class SuccessCheckEmailState extends ForgetPasswordState {
  final String message;

  const SuccessCheckEmailState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorCheckEmailState extends ForgetPasswordState {
  final String errorMessage;

  const ErrorCheckEmailState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
