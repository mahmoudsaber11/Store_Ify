import 'package:store_ify/core/models/user_model.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginChangePasswordVisibility extends LoginState {
  final bool isPassword;

  LoginChangePasswordVisibility({required this.isPassword});
}

class SignInLoadingState extends LoginState {}

class SignInSuccessState extends LoginState {
  final UserModel userModel;
  final String uId;
  SignInSuccessState(this.uId, {required this.userModel});
}

class SignInErrorState extends LoginState {
  final String error;

  SignInErrorState(this.error);
}

class SignInWithGoogleLoadingState extends LoginState {}

class SignInWithGoogleSuccessState extends LoginState {
  final String uId;

  SignInWithGoogleSuccessState(this.uId);
}

class SignInWithGoogleErrorState extends LoginState {
  final String error;

  SignInWithGoogleErrorState({required this.error});
}
