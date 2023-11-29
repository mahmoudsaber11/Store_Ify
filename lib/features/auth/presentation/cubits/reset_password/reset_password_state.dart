part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object?> get props => [];
}

class InitialResetPasswordState extends ResetPasswordState {
  const InitialResetPasswordState();
}

class LoadingResetPasswordState extends ResetPasswordState {
  const LoadingResetPasswordState();
}

class SuccessResetPasswordState extends ResetPasswordState {
  final String message;

  const SuccessResetPasswordState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorResetPasswordState extends ResetPasswordState {
  final String errorMessage;

  const ErrorResetPasswordState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ResetChangePasswordVisibility extends ResetPasswordState {
  final bool isPassword;

  const ResetChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}
