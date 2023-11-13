import 'package:flutter/material.dart';
import 'package:store_ify/Features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/features/auth/login/presentation/views/login_view.dart';
import 'package:store_ify/features/auth/reset_password/reset_password_view.dart';
import 'package:store_ify/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/features/auth/verification/verification_view.dart';
import 'package:store_ify/features/layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:store_ify/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());

      case Routes.loginViewRoute:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case Routes.signUpViewRoute:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordView());

      case Routes.resetPasswordViewRoute:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordView());

      case Routes.verificationViewRoute:
        return MaterialPageRoute(
            builder: (context) => const VerificationView());

      case Routes.storeifyLayoutViewRoute:
        return MaterialPageRoute(builder: (context) => const StoreIfyLayout());

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(
            "Un Found Route",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
