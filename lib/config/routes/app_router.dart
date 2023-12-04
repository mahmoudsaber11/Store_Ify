import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/config/routes/routes.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:store_ify/features/auth/presentation/views/forget_password_view.dart';
import 'package:store_ify/features/auth/presentation/views/login_view.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/views/reset_password_view.dart';
import 'package:store_ify/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:store_ify/features/auth/presentation/views/sign_up_view.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_cubit.dart';
import 'package:store_ify/features/auth/presentation/views/verification_view.dart';
import 'package:store_ify/features/categories/presentation/view/categories_view.dart';
import 'package:store_ify/features/layout/presentation/views/layout_view.dart';
import 'package:store_ify/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:store_ify/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:store_ify/features/product_details/presentation/view/product_details_view.dart';
import 'package:store_ify/features/products/presentation/view/products_view.dart';
import 'package:store_ify/features/splash/presentation/views/splash_view.dart';

class AppRouter {
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
        final args = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => serviceLocator.get<ResetPasswordCubit>(),
            child: ResetPasswordView(
              email: args,
            ),
          ),
        );

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

      // case Routes.storeifyLayoutViewRoute:
      //   return MaterialPageRoute(builder: (context) => const StoreIfyLayout());

      case Routes.categoriesViewRoute:
        return MaterialPageRoute(builder: (context) => const CategoriesView());

      case Routes.productsViewRoute:
        return MaterialPageRoute(builder: (context) => const ProductsView());

      case Routes.productDetailsViewRoute:
        return MaterialPageRoute(
            builder: (context) => const ProductDetailsView());

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
