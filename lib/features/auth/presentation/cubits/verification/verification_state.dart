part of 'verification_cubit.dart';

abstract class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object?> get props => [];
}

class InitialCheckVerificationState extends VerificationState {
  const InitialCheckVerificationState();
}

class LoadingVerificationState extends VerificationState {
  const LoadingVerificationState();
}

class SuccessVerificationState extends VerificationState {
  final String message;

  const SuccessVerificationState({required this.message});

  @override
  List<Object?> get props => [message];
}

class ErrorVerificationState extends VerificationState {
  final String errorMessage;

  const ErrorVerificationState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
