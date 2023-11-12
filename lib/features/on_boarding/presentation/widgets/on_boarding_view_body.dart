import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/features/auth/login/presentation/views/login_view.dart';

import 'package:store_ify/core/widgets/custom_buttons.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/custom_indicator.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/custom_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController? pageController;

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
          child: CustomIndicator(
            dotIndex: pageController!.hasClients ? pageController?.page : 0,
          ),
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: 66,
            right: 32,
            child: TextButton(
              onPressed: () {
                Get.to(() => const LoginView());
              },
              child: const Text(
                "Skip",
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
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
                if (pageController!.page! < 2) {
                  pageController?.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                } else {
                  Get.to(() => const LoginView(),
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500));
                }
              },
              text: pageController!.hasClients
                  ? (pageController?.page == 2 ? 'Get Started' : 'Next')
                  : 'Next',
            ))
      ],
    );
  }
}
