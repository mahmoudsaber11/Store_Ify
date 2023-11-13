import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/layout/presentation/cubit/store_ify_states.dart';

class StoreIfyCubit extends Cubit<StoreIfyState> {
  StoreIfyCubit() : super(StoreIfyInitialState());
  static StoreIfyCubit get(context) => BlocProvider.of(context);
  var currentIndex = 0;
  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
