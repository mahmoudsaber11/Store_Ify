import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/app.dart';
import 'package:store_ify/bloc_observer.dart';
import 'package:store_ify/core/utils/firebase_options.dart';
import 'package:store_ify/core/utils/service_locator.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await ServiceLocator().setupServiceLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StoreIfyApp());
}
