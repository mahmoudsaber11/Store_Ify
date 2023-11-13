import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/custom_indicator.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPageView(
          pageController: pageController,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 210,
          child: Align(
            alignment: Alignment.center,
            child: CustomIndicator(
              pageController: pageController,
              dotIndex: pageController.hasClients ? pageController.page : 0,
            ),
          ),
        ),
        Visibility(
          visible: pageController.hasClients
              ? (pageController.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: 66,
            right: 32,
            child: TextButton(
              onPressed: () {
                context.navigateTo(routeName: Routes.loginViewRoute);
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 140,
          left: 80,
          right: 80,
          child: CustomGeneralButton(
            onPressed: () {
              if (pageController.page! < 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                context.navigateTo(routeName: Routes.loginViewRoute);
              }
            },
            text: pageController.hasClients
                ? (pageController.page == 2 ? 'Get Started' : 'Next')
                : 'Next',
          ),
        ),
      ],
    );
  }
}
