abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangePasswordVisibility extends LoginState {
  final bool isPassword;

  LoginChangePasswordVisibility({required this.isPassword});
}
