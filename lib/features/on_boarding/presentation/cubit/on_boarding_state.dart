part of 'on_boarding_cubit.dart';

abstract class OnBoardingState {
  const OnBoardingState();
}

class OnBoardingInitial extends OnBoardingState {}

class PageViewIndexChangedState extends OnBoardingState {
  final int index;

  const PageViewIndexChangedState({required this.index});
}

class SkipToLoginState extends OnBoardingState {}

class NavigateBetweenPages extends OnBoardingState {}
