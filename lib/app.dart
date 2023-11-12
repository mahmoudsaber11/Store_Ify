import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:store_ify/features/splash/presentation/views/splash_view.dart';

class StoreIfyApp extends StatelessWidget {
  const StoreIfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
