import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/stores/data/repositories/stores_repo.dart';
import 'package:store_ify/features/home/data/cubit/stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  StoresCubit({required this.storesRepo}) : super(const StoreInitial());
  final StoresRepo storesRepo;

  Future getStores() async {
    emit(const StoreLoading());
    storesRepo.getStores().then((value) {
      value.fold((failure) {
        emit(StoreError(error: failure.errMessage.toString()));
      }, (stores) {
        emit(StoreSuccess(store: stores));
      });
    });
  }
}
