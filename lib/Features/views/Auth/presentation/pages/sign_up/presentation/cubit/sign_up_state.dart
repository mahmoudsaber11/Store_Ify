abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpChangePasswordVisibility extends SignUpState {
  final bool isPassword;

  SignUpChangePasswordVisibility({required this.isPassword});
}
