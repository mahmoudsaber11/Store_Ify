import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/config/routes/app_routes.dart';
import 'package:store_ify/config/themes/app_themes.dart';
import 'package:store_ify/core/app_cubit/custom_tabs_cubit/custom_tabs_cubit.dart';
import 'package:store_ify/core/utils/app_strings.dart';
import 'package:store_ify/core/utils/service_locator.dart';
import 'package:store_ify/features/layout/presentation/cubit/layout_cubit.dart';

class StoreIfyApp extends StatelessWidget {
  const StoreIfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator.get<LayoutCubit>(),
        ),
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        title: AppStrings.appTitle,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
