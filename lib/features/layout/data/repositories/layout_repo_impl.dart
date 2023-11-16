import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/cart/presentation/view/cart_view.dart';
import 'package:store_ify/features/favorite/presentation/view/favorite_view.dart';
import 'package:store_ify/features/home/presentation/view/home_view.dart';
import 'package:store_ify/features/layout/data/repositories/layout_repo.dart';
import 'package:store_ify/features/layout/presentation/cubit/layout_cubit.dart';
import 'package:store_ify/features/stores/presentation/view/stores_view.dart';

class LayoutRepoImpl implements LayoutRepo {
  @override
  void changeBottomNav({required int index, required context}) {
    BlocProvider.of<LayoutCubit>(context).currentIndex = index;
  }

  @override
  List<Widget> views() {
    return [
      const HomeView(),
      const StoresView(),
      const CartView(),
      const FavoriteView()
    ];
  }
}
