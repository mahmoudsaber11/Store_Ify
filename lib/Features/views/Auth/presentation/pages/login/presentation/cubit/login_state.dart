abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangePasswordVisibility extends LoginState {
  final bool isPassword;

  LoginChangePasswordVisibility({required this.isPassword});
}

class SignInLoadingState extends LoginState {}

class SignInSuccessState extends LoginState {}

class SignInErrorState extends LoginState {
  final String error;

  SignInErrorState(this.error);
}
