import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/app_cubit/custom_tabs_cubit/custom_tabs_cubit.dart';
import 'package:store_ify/core/app_cubit/custom_tabs_cubit/custom_tabs_state.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_button_app.dart';
import 'package:store_ify/features/products/presentation/widgets/products_list_view.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProductCubit>(context);
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      context.getBack();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    )),
                const Text(
                  "Clothes",
                  style: AppTextStyles.textStyle16Regular,
                ),
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomButtonOutliendApp(
                        text: "Man",
                        onPressed: () {
                          cubit.toggleListView1();
                        },
                        buttonStyle: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: cubit.isListView1Visible
                                  ? AppColors.primaryColor
                                  : AppColors.textColor),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButtonOutliendApp(
                        text: "Woman",
                        onPressed: () {
                          cubit.toggleListView2();
                        },
                        buttonStyle: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: cubit.isListView2Visible
                                  ? AppColors.primaryColor
                                  : AppColors.textColor),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomButtonOutliendApp(
                        text: "Kids",
                        onPressed: () {
                          cubit.toggleListView3();
                        },
                        buttonStyle: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: cubit.isListView3Visible
                                  ? AppColors.primaryColor
                                  : AppColors.textColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            if (cubit.isListView1Visible == true)
              Expanded(
                  child: ProductsListView(
                image: AppAssets.testClothesMan,
                visible: cubit.isListView1Visible,
              )),
            if (cubit.isListView2Visible == true)
              Expanded(
                  child: ProductsListView(
                      image: AppAssets.testClothesWoman,
                      visible: cubit.isListView2Visible)),
            if (cubit.isListView3Visible == true)
              Expanded(
                  child: ProductsListView(
                      image: AppAssets.testClothesWoman,
                      visible: cubit.isListView3Visible)),
          ],
        );
      },
    );
  }
}