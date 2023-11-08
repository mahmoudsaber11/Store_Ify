import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/views/login_view.dart';
import 'package:store_ify/Features/views/splash/presentation/views/splash_view.dart';
import 'package:store_ify/Features/views/store_ify_layout/presentation/views/store_ify_layout.dart';
import 'package:store_ify/core/utils/bloc_observer.dart';

void main(List<String> args) {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StoreIfyApp());
}

class StoreIfyApp extends StatelessWidget {
  const StoreIfyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
