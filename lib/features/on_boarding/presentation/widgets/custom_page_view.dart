import 'package:flutter/material.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/page_view_item.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.pageController});
  final PageController? pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          image: AppAssets.imagesOnBoarding1,
          title: 'Welcome to Store-ify',
          subTitle:
              'Explore a world of endless possibilities. Store-ify is your one-stop destination for a diverse range of stores and products.',
        ),
        PageViewItem(
          image: AppAssets.imagesOnBoarding2,
          title: 'Discover & Shop',
          subTitle:
              'Browse through a variety of stores and products. Find the latest trends, exclusive deals, and more. Your next great find is just a tap away',
        ),
        PageViewItem(
          image: AppAssets.imagesOnBoarding3,
          title: 'Easy of Delivery',
          subTitle:
              'Enjoy a seamless shopping experience. Shop from multiple stores in one place, use our search options to find what you need, and discover a new way to shop.',
        )
      ],
    );
  }
}
