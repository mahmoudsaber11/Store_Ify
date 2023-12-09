import 'package:equatable/equatable.dart';
import 'package:store_ify/features/categories/data/models/categories_model.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoading extends CategoryState {
  const CategoryLoading();
}

class CategorySuccess extends CategoryState {
  final List<CategoriesModel> category;

  const CategorySuccess({required this.category});

  @override
  List<Object> get props => [category];
}

class CategoryError extends CategoryState {
  final String error;

  const CategoryError({required this.error});

  @override
  List<Object> get props => [error];
}
