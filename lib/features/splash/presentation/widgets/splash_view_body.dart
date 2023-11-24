import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          AppAssets.appIcon,
          // height: 192,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 16),
        const Text(
          textAlign: TextAlign.center,
          "Store-ify",
          style: TextStyle(
            fontSize: 24,
            fontFamily: AppStrings.pottaOneFont,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 64),
        const SpinKitRing(
          color: AppColors.primaryColor,
          size: 87,
        ),
      ],
    );
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 3), (() {
      context.navigateAndReplacement(newRoute: Routes.onBoardingViewRoute);
    }));
  }

  void _setSystemUIOverlayStyle() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final double bottomPadding = View.of(context).viewPadding.bottom;

    // Set the color based on the presence of the system navigation bar
    final Color? systemNavigationBarColor =
        bottomPadding > 0 ? null : Colors.transparent;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
