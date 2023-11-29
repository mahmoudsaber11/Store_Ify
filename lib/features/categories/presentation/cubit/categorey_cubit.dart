import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/categories/presentation/cubit/categorey_state.dart';
import 'package:store_ify/features/categories/data/repositories/categorey_repo.dart';

class CategoreyCubit extends Cubit<CategoreyState> {
  CategoreyCubit(this.categoreyRepo) : super(CategoreyInitial());
  final CategoreyRepo categoreyRepo;

  Future getCategories() async {
    emit(CategoreyLoadingState());
    categoreyRepo.getCategories().then((value) {
      value.fold((failure) {
        emit(CategoreyErrorState(error: failure.errMessage.toString()));
      }, (categorey) {
        emit(CategoreySuccessState(categorey: categorey));
      });
    });
  }
}
