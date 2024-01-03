import 'package:equatable/equatable.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';

abstract class ClothesState extends Equatable {
  const ClothesState();

  @override
  List<Object> get props => [];
}

class ClohtesInitial extends ClothesState {
  const ClohtesInitial();
}

class ClothesLoading extends ClothesState {
  const ClothesLoading();
}

class ClothesSuccess extends ClothesState {
  final List<StoresModel> clothes;

  const ClothesSuccess({required this.clothes});

  @override
  List<Object> get props => [clothes];
}

class ClothesError extends ClothesState {
  final String error;

  const ClothesError({required this.error});

  @override
  List<Object> get props => [error];
}
