import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/stores/data/repositories/stores_repo.dart';
import 'package:store_ify/features/stores/presentation/cubit/clothes/clothes_state.dart';

class ClothesCubit extends Cubit<ClothesState> {
  ClothesCubit({required this.storesRepo}) : super(const ClohtesInitial());
  final StoresRepo storesRepo;

  Future getClothes() async {
    emit(const ClothesLoading());
    storesRepo.getClothes().then((value) {
      value.fold((failure) {
        emit(ClothesError(error: failure.errMessage.toString()));
      }, (clothes) {
        emit(ClothesSuccess(clothes: clothes));
      });
    });
  }
}
