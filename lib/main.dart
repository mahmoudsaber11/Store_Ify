import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/views/login_view.dart';
import 'package:store_ify/core/utils/bloc_observer.dart';
import 'package:store_ify/firebase_options.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
