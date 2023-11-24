import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/features/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:store_ify/features/on_boarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {
              BlocProvider.of<OnBoardingCubit>(context)
                  .skipToLogin(context: context);
            },
            child: const Text(
              "Skip",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 24,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          return OnBoardingViewBody(
            cubit: BlocProvider.of<OnBoardingCubit>(context),
          );
        },
      ),
    );
  }
}
