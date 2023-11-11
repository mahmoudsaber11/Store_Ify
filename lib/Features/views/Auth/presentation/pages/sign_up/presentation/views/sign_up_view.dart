import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/data/repositories/register_repo_impl.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/sign_up/presentation/widgets/sign_up_view_body.dart';
import 'package:store_ify/core/utils/api_service.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (BuildContext context) =>
              SignUpCubit(RegisterRepoImpl(ApiService(Dio()))),
          child: const SignUpViewBody()),
    );
  }
}
