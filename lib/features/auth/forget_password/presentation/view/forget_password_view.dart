import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/auth/forget_password/data/repositories/check_email_repo_impl.dart';
import 'package:store_ify/Features/auth/forget_password/presentation/cubit/check_email_cubit.dart';
import 'package:store_ify/Features/auth/forget_password/presentation/widgets/forget_password_view_body.dart';
import 'package:store_ify/core/api/dio_consumer.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) =>
            CheckEmailCubit(CheckEmailRepoImpl(DioConsumer(Dio()))),
        child: const ForgetPasswordViewBody(),
      ),
    );
  }
}
