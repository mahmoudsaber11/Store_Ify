import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:store_ify/features/home/presentation/widgets/categories_list_view.dart';
import 'package:store_ify/features/home/presentation/widgets/section_upper.dart';
import 'package:store_ify/features/home/presentation/widgets/stores_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 13, right: 10).w,
        child: Column(
          children: [
            const SectionUpper(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      "Best Selling",
                      style: AppTextStyles.textStyle16Regular,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    const BestSellerListView(),
                    SizedBox(
                      height: 14.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Categories",
                          style: AppTextStyles.textStyle16Regular,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            context.navigateTo(
                                routeName: Routes.categoriesViewRoute);
                          },
                          child: Text(
                            "View all",
                            style: AppTextStyles.textStyle16Regular
                                .copyWith(color: AppColors.iconsColor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const CategoriesListView(),
                    SizedBox(
                      height: 13.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Top Stores",
                          style: AppTextStyles.textStyle16Regular,
                        ),
                        const Spacer(),
                        Text(
                          "View all",
                          style: AppTextStyles.textStyle16Regular
                              .copyWith(color: AppColors.iconsColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 23.h,
                    ),
                    const StoresListView(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
