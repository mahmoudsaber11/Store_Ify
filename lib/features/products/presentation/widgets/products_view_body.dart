import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_outlined_button.dart';
import 'package:store_ify/features/products/presentation/widgets/products_list_view.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  final List<String> text = ["Man", "Woman", "Kids"];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
            Text(
              "Clothes",
              style: AppTextStyles.textStyle16Regular,
            ),
          ],
        ),
        SizedBox(
          height: 29.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 25,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CustomButtonOutlinedApp(
                  onPressed: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  text: text[index],
                  activeColor: currentIndex == index
                      ? AppColors.primaryColor
                      : AppColors.textColor,
                );
              },
              itemCount: 3,
              separatorBuilder: ((context, index) => SizedBox(
                    width: 8.h,
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        if (currentIndex == 0)
          const Expanded(
              child: ProductsListView(
            image: AppAssets.testClothesMan,
          )),
        if (currentIndex == 1)
          const Expanded(
              child: ProductsListView(
            image: AppAssets.testClothesWoman,
          )),
        if (currentIndex == 2)
          const Expanded(
              child: ProductsListView(
            image: AppAssets.testClothesWoman,
          )),
      ],
    );
  }
}
