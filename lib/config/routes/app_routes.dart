import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/auth/forget_password/presentation/view/forget_password_view.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/models/login_params.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/views/login_view.dart';
import 'package:store_ify/features/auth/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:store_ify/features/auth/reset_password/presentation/view/reset_password_view.dart';
import 'package:store_ify/features/auth/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:store_ify/features/auth/verification/presentation/cubit/verification_cubit.dart';
import 'package:store_ify/features/auth/verification/presentation/view/verification_view.dart';
import 'package:store_ify/features/layout/presentation/views/layout_view.dart';
import 'package:store_ify/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:store_ify/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:store_ify/features/splash/presentation/views/splash_view.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case Routes.onBoardingViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<OnBoardingCubit>(),
            child: const OnBoardingView(),
          ),
        );

      case Routes.loginViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<LoginCubit>(),
            child: const LoginView(),
          ),
        );

      case Routes.signUpViewRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<SignUpCubit>(),
            child: const SignUpView(),
          ),
        );

      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<ForgetPasswordCubit>(),
            child: const ForgetPasswordView(),
          ),
        );

      case Routes.resetPasswordViewRoute:
        final args = routeSettings.arguments as LoginParams;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => serviceLocator.get<ResetPasswordCubit>(),
                  child: ResetPasswordView(
                    email: args.email,
                    password: args.password,
                  ),
                ));

      case Routes.verificationViewRoute:
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<VerificationCubit>(),
            child: VerificationView(
              email: args,
            ),
          ),
        );

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
