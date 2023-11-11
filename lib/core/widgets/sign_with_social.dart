import 'package:flutter/material.dart';
import 'package:store_ify/Features/views/Auth/presentation/pages/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/core/utils/assets.dart';

class SignWithSocial extends StatelessWidget {
  const SignWithSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(onTap: () {}, child: Image.asset(AssetsData.face)),
        InkWell(
            onTap: () {
              LoginCubit.get(context).signInWithGoogle();
            },
            child: Image.asset(
              AssetsData.google,
            )),
        InkWell(onTap: () {}, child: Image.asset(AssetsData.twet)),
      ],
    );
  }
}
