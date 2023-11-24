import 'package:flutter/material.dart';

import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/custom_indicator.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key, required this.cubit});

  final OnBoardingCubit cubit;

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 4,
          child: LayoutBuilder(
            builder: (_, __) {
              return PageView.builder(
                controller: pageController,
                itemCount: widget.cubit.onBoardingPages().length,
                itemBuilder: (context, index) => PageViewItem(
                  pageInfo: widget.cubit.onBoardingPages()[index],
                ),
                onPageChanged: (int index) {
                  widget.cubit.onChangePageIndex(index);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.center,
          child: CustomIndicator(
            pageController: pageController,
            dotIndex: pageController.hasClients ? pageController.page : 0,
          ),
        ),
        const SizedBox(height: 40),
        CustomGeneralButton(
          onPressed: () => _navigateAmongOnBoarding(context),
          text: pageController.hasClients
              ? (pageController.page == 2 ? 'Get Started' : 'Next')
              : 'Next',
        ),
        const Spacer(),
      ],
    );
  }

  void _navigateAmongOnBoarding(BuildContext context) {
    if (widget.cubit.isLastBoarding) {
      widget.cubit.skipToLogin(context: context);
    } else {
      widget.cubit.navigateBetweenPages(
        context: context,
        pageController: pageController,
      );
    }
  }
}
