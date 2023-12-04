import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/widgets/custom_category_item.dart';
import 'package:store_ify/features/categories/presentation/cubit/categorey_state.dart';
import 'package:store_ify/features/categories/presentation/cubit/category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';

class AllCategoriesListView extends StatelessWidget {
  const AllCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccessState) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                  itemCount: state.category.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10.w),
                  itemBuilder: (context, index) => CustomCategoryItem(
                        categoriesModel: state.category[index],
                        onTap: () {
                          context.navigateTo(
                              routeName: Routes.productsViewRoute);
                        },
                      )));
        } else {
          return const CustomCircularProgressIndicator();
        }
      },
    );
  }
}
