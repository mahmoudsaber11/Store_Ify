import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/features/stores/presentation/cubit/food/food_cubit.dart';
import 'package:store_ify/features/stores/presentation/cubit/food/food_state.dart';
import 'package:store_ify/features/stores/presentation/widgets/custom_stores_item.dart';

class FoodGridView extends StatelessWidget {
  const FoodGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodState>(
      builder: (context, state) {
        if (state is FoodSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              itemCount: state.food.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              itemBuilder: (context, index) => CustomStoresItem(
                storesModel: state.food[index],
              ),
            ),
          );
        } else if (state is FoodError) {
          return showToast(text: state.error, state: ToastStates.error);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
