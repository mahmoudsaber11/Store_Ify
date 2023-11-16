import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:store_ify/features/auth/login/presentation/cubit/login_state.dart';

class UserLoginForm extends StatefulWidget {
  const UserLoginForm({
    super.key,
    required this.state,
  });
  final LoginState state;

  @override
  State<UserLoginForm> createState() => _UserLoginFormState();
}

class _UserLoginFormState extends State<UserLoginForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _disposeController();
  }

  void _disposeController() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "E-mail",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 9),
          CustomTextField(
            validate: (String? value) => Helper.validateEmailField(value),
            controller: emailController,
            inputType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
          ),
          const SizedBox(
            height: 38,
          ),
          Text(
            "password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 9),
          CustomTextField(
            validate: (String? value) => Helper.validatePasswordField(value),
            onSubmitted: (_) => _login(context),
            controller: passwordController,
            inputType: TextInputType.visiblePassword,
            hintText: '*********',
            isPassword: BlocProvider.of<LoginCubit>(context).isPassword,
            suffix: IconButton(
              onPressed: () {
                BlocProvider.of<LoginCubit>(context).changePasswordVisibility();
              },
              icon: Icon(
                BlocProvider.of<LoginCubit>(context).isPassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ConditionalBuilder(
            condition: widget.state is! SignInLoadingState,
            builder: (context) {
              return CustomGeneralButton(
                text: 'Log in',
                onPressed: () => _login(context),
              );
            },
            fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _login(BuildContext context) {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<LoginCubit>(context).userSignIn(
          email: emailController.text.trim(),
          password: passwordController.text);
    }
  }
}
