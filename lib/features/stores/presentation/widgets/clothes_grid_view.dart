import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/features/stores/presentation/cubit/clothes/clothes_cubit.dart';
import 'package:store_ify/features/stores/presentation/cubit/clothes/clothes_state.dart';
import 'package:store_ify/features/stores/presentation/widgets/custom_stores_item.dart';

class ClothesGridView extends StatelessWidget {
  const ClothesGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClothesCubit, ClothesState>(
      builder: (context, state) {
        if (state is ClothesSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GridView.builder(
              itemCount: state.clothes.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10),
              itemBuilder: (context, index) => CustomStoresItem(
                storesModel: state.clothes[index],
              ),
            ),
          );
        } else if (state is ClothesError) {
          return showToast(text: state.error, state: ToastStates.error);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
