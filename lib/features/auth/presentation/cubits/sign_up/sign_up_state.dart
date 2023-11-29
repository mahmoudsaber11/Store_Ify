part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {
  const SignUpInitial();
}

class SignUpChangePasswordVisibility extends SignUpState {
  final bool isPassword;

  const SignUpChangePasswordVisibility({required this.isPassword});

  @override
  List<Object?> get props => [isPassword];
}

class SignUpLoadingState extends SignUpState {
  const SignUpLoadingState();
}

class SignUpSuccessState extends SignUpState {
  final UserModel userModel;

  const SignUpSuccessState({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

class SignUpErrorState extends SignUpState {
  final String error;

  const SignUpErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class SignUpWithGoogleLoadingState extends SignUpState {
  const SignUpWithGoogleLoadingState();
}

class SignUpWithGoogleSuccessState extends SignUpState {
  final String uId;

  const SignUpWithGoogleSuccessState({required this.uId});

  @override
  List<Object?> get props => [uId];
}

class SignUpWithGoogleErrorState extends SignUpState {
  final String error;

  const SignUpWithGoogleErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
