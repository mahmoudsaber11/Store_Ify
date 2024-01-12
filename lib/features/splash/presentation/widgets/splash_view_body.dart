import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/helpers/cache_helper.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_assets.dart';
import 'package:store_ify/config/themes/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/core/utils/app_strings.dart';
import 'package:store_ify/service_locator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  late Timer _timer;

  void _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2500), () => _goToNext());
  }

  void _goToNext() {
    Helper.uId = serviceLocator.get<CacheHelper>().getStringData(key: 'uId');

    bool? onBoarding =
        serviceLocator.get<CacheHelper>().getBoolData(key: 'onBoarding');

    if (onBoarding != null) {
      if (Helper.uId != null) {
        context.navigateAndReplacement(
            newRoute: Routes.storeifyLayoutViewRoute);
      } else {
        context.navigateAndReplacement(newRoute: Routes.loginViewRoute);
      }
    } else {
      context.navigateAndReplacement(newRoute: Routes.onBoardingViewRoute);
    }
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
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

  @override
  void didChangeDependencies() {
    _setSystemUIOverlayStyle();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          AppAssets.appIcon,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 16.h),
        Text(
          textAlign: TextAlign.center,
          "Store-ify",
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: AppStrings.pottaOneFont,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor,
          ),
        ),
        SizedBox(height: 64.h),
        SpinKitRing(
          color: AppColors.primaryColor,
          size: 87.sp,
        ),
      ],
    );
  }
}
