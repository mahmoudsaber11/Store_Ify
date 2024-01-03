import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/stores/data/repositories/stores_repo.dart';
import 'package:store_ify/features/stores/presentation/cubit/food/food_state.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit({required this.storesRepo}) : super(const FoodInitial());
  final StoresRepo storesRepo;

  Future getFood() async {
    emit(const FoodLoading());
    storesRepo.getFood().then((value) {
      value.fold((failure) {
        emit(FoodError(error: failure.errMessage.toString()));
      }, (food) {
        emit(FoodSuccess(food: food));
      });
    });
  }
}
