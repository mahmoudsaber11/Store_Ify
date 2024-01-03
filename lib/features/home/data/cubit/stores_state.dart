import 'package:equatable/equatable.dart';
import 'package:store_ify/features/stores/data/models/stores_model.dart';

abstract class StoresState extends Equatable {
  const StoresState();

  @override
  List<Object> get props => [];
}

class StoreInitial extends StoresState {
  const StoreInitial();
}

class StoreLoading extends StoresState {
  const StoreLoading();
}

class StoreSuccess extends StoresState {
  final List<StoresModel> store;

  const StoreSuccess({required this.store});

  @override
  List<Object> get props => [store];
}

class StoreError extends StoresState {
  final String error;

  const StoreError({required this.error});

  @override
  List<Object> get props => [error];
}
