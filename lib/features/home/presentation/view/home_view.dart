import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/features/home/presentation/widgets/best_seller_list_view.dart';
import 'package:store_ify/features/home/presentation/widgets/categories_list_view.dart';
import 'package:store_ify/features/home/presentation/widgets/section_upper.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 13, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SectionUpper(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Best Selling",
                style: AppTextStyles.textStyle16Regular,
              ),
              const SizedBox(
                height: 25,
              ),
              const BestSellerlistView(),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  const Text(
                    "Categories",
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
              const SizedBox(
                height: 30,
              ),
              const CategorieslistView(),
              const SizedBox(
                height: 13,
              ),
              Row(
                children: [
                  const Text(
                    "Categories",
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
              const SizedBox(
                height: 23,
              )
            ],
          ),
        ),
      ),
    );
  }
}
