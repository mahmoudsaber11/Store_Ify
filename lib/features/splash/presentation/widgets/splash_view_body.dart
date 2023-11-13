import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_strings.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;
  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
    _navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppAssets.appIcon,
          height: 192,
        ),
        const SizedBox(height: 16),
        AnimatedBuilder(
          animation: _slidingAnimation,
          builder: (BuildContext context, Widget? child) {
            return SlideTransition(
              position: _slidingAnimation,
              child: const Text(
                textAlign: TextAlign.center,
                "Store-ify",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppStrings.pottaOneFont,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  void _initSlidingAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), (() {
      context.navigateAndReplacement(newRoute: Routes.onBoardingViewRoute);
    }));
  }
}
