import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/features/auth/login/data/repositories/login_repo_impl.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/widgets/login_view_body.dart';
import 'package:store_ify/core/api/dio_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) =>
              LoginCubit(LoginRepoImpl(DioConsumer(Dio()))),
          child: const LoginViewBody()),
    );
  }
}
