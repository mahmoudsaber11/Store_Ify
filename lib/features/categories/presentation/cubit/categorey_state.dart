import 'package:equatable/equatable.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoadingState extends CategoryState {}

final class CategorySuccessState extends CategoryState {
  final List<CategoriesModel> category;

  const CategorySuccessState({required this.category});

  @override
  List<Object> get props => [category];
}

class CategoryErrorState extends CategoryState {
  final String error;

  const CategoryErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
