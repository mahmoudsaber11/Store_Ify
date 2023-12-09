part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginChangePasswordVisibility extends LoginState {
  final bool isPassword;

  const LoginChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccess extends LoginState {
  final User userModel;

  const LoginSuccess({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class SignInError extends LoginState {
  final String error;

  const SignInError({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignInWithGoogleLoading extends LoginState {
  const SignInWithGoogleLoading();
}

class SignInWithGoogleSuccess extends LoginState {
  final String uId;

  const SignInWithGoogleSuccess({required this.uId});

  @override
  List<Object?> get props => [uId];
}

class SignInWithGoogleError extends LoginState {
  final String error;

  const SignInWithGoogleError({required this.error});

  @override
  List<Object?> get props => [error];
}
