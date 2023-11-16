abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class ChangeBottomNavState extends LayoutState {
  final int index;

  ChangeBottomNavState(this.index);
}
