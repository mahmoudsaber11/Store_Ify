import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/on_Boarding/presentation/views/on_boarding_view.dart';
import 'package:store_ify/core/utils/constant.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 192, child: Image.asset('assets/images/logo 1.png')),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (BuildContext context, Widget? child) {
            return SlideTransition(
              position: slidingAnimation,
              child: Text(
                textAlign: TextAlign.center,
                "Store-ify",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'PottaOne-Regular',
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.to(() => const OnBoardingView(), transition: Transition.fade);
    }));
  }
}
