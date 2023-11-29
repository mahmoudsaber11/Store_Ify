import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/categories/presentation/cubit/categorey_state.dart';
import 'package:store_ify/features/categories/data/repositories/category_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({required this.categoryRepo}) : super(CategoryInitial());
  final CategoryRepo categoryRepo;

  Future getCategories() async {
    emit(CategoryLoadingState());
    categoryRepo.getCategories().then((value) {
      value.fold((failure) {
        emit(CategoryErrorState(error: failure.errMessage.toString()));
      }, (categorey) {
        emit(CategorySuccessState(category: categorey));
      });
    });
  }
}
