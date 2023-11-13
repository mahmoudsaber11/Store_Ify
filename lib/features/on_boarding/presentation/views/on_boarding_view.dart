import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_navigator.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
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
          )
        ],
      ),
      body: const OnBoardingViewBody(),
    );
  }
}
