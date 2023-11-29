import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_category_item.dart';
import 'package:store_ify/features/categories/presentation/cubit/categorey_state.dart';
import 'package:store_ify/features/categories/presentation/cubit/categorey_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoreyCubit, CategoreyState>(
      builder: (context, state) {
        if (state is CategoreySuccessState) {
          return SizedBox(
            height: 166.h,
            child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CustomCategoryItem(
                    categoriesModel: state.categorey[index],
                  );
                },
                separatorBuilder: ((context, index) => SizedBox(
                      height: 10.h,
                    )),
                itemCount: state.categorey.length),
          );
        } else if (state is CategoreyErrorState) {
          return showToast(text: state.error, state: ToastStates.error);
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
