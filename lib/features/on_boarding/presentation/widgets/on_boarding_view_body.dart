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
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomPageView(
          pageController: _pageController,
        ),
        Align(
          alignment: Alignment.center,
          child: CustomIndicator(
            pageController: _pageController,
            dotIndex: _pageController.hasClients ? _pageController.page : 0,
          ),
        ),
        CustomGeneralButton(
          onPressed: () {
            if (_pageController.page! < 2) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            } else {
              context.navigateTo(routeName: Routes.loginViewRoute);
            }
          },
          text: _pageController.hasClients
              ? (_pageController.page == 2 ? 'Get Started' : 'Next')
              : 'Next',
        ),
      ],
    );
  }
}
