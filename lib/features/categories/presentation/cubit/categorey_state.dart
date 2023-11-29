import 'package:equatable/equatable.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';

abstract class CategoreyState extends Equatable {
  const CategoreyState();

  @override
  List<Object> get props => [];
}

final class CategoreyInitial extends CategoreyState {}

final class CategoreyLoadingState extends CategoreyState {}

final class CategoreySuccessState extends CategoreyState {
  final List<CategoriesModel> categorey;

  const CategoreySuccessState({required this.categorey});

  @override
  List<Object> get props => [categorey];
}

class CategoreyErrorState extends CategoreyState {
  final String error;

  const CategoreyErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
