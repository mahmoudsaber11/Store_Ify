part of 'on_boarding_cubit.dart';

abstract class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object?> get props => [];
}

class OnBoardingInitial extends OnBoardingState {
  const OnBoardingInitial();
}

class PageViewIndexChangedState extends OnBoardingState {
  final int index;

  const PageViewIndexChangedState({required this.index});

  @override
  List<Object?> get props => [index];
}

class SkipToLoginState extends OnBoardingState {
  const SkipToLoginState();
}

class NavigateBetweenPages extends OnBoardingState {
  const NavigateBetweenPages();
}
