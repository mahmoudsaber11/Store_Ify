import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/features/home/data/cubit/stores_cubit.dart';
import 'package:store_ify/features/home/data/cubit/stores_state.dart';
import 'package:store_ify/features/stores/presentation/widgets/custom_stores_item.dart';

class StoresListView extends StatelessWidget {
  const StoresListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoresCubit, StoresState>(
      builder: (context, state) {
        if (state is StoreSuccess) {
          return SizedBox(
            height: 166.h,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomStoresItem(
                    storesModel: state.store[index],
                  );
                },
                separatorBuilder: ((context, index) => SizedBox(
                      height: 10.h,
                    )),
                itemCount: state.store.length),
          );
        }
        if (state is StoreError) {
          return showToast(text: state.error, state: ToastStates.error);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
