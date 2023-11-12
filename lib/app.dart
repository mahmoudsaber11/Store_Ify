import 'package:flutter/material.dart';
import 'package:store_ify/config/routes/app_routes.dart';
import 'package:store_ify/config/themes/app_themes.dart';
import 'package:store_ify/core/utils/app_strings.dart';

class StoreIfyApp extends StatelessWidget {
  const StoreIfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      title: AppStrings.appTitle,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
