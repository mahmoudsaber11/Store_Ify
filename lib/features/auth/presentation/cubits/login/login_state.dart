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

class SignInLoadingState extends LoginState {
  const SignInLoadingState();
}

class SignInSuccessState extends LoginState {
  final User userModel;

  const SignInSuccessState({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class SignInErrorState extends LoginState {
  final String error;

  const SignInErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignInWithGoogleLoadingState extends LoginState {
  const SignInWithGoogleLoadingState();
}

class SignInWithGoogleSuccessState extends LoginState {
  final String uId;

  const SignInWithGoogleSuccessState({required this.uId});

  @override
  List<Object?> get props => [uId];
}

class SignInWithGoogleErrorState extends LoginState {
  final String error;

  const SignInWithGoogleErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
