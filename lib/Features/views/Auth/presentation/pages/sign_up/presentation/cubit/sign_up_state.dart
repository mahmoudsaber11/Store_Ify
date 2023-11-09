import 'package:store_ify/core/models/user_model.dart';

abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpChangePasswordVisibility extends SignUpState {
  final bool isPassword;

  SignUpChangePasswordVisibility({required this.isPassword});
}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final UserModel userModel;

  SignUpSuccessState({required this.userModel});
}

class SignUpErrorState extends SignUpState {
  final String error;

  SignUpErrorState(this.error);
}
