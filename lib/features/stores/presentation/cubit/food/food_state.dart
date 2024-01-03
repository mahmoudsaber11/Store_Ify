import 'package:equatable/equatable.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {
  const FoodInitial();
}

class FoodLoading extends FoodState {
  const FoodLoading();
}

class FoodSuccess extends FoodState {
  final List<StoresModel> food;

  const FoodSuccess({required this.food});

  @override
  List<Object> get props => [food];
}

class FoodError extends FoodState {
  final String error;

  const FoodError({required this.error});

  @override
  List<Object> get props => [error];
}
