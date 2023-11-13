import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/api/dio_consumer.dart';

import 'package:store_ify/features/auth/forget_password/data/repositories/forget_password_repo_impl.dart';
import 'package:store_ify/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:store_ify/features/auth/forget_password/presentation/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => ForgetPasswordCubit(
          forgetPasswordRepo: ForgetPasswordRepoImpl(
            dioConsumer: DioConsumer(Dio()),
          ),
        ),
        child: const ForgetPasswordViewBody(),
      ),
    );
  }
}
