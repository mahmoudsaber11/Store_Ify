import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/app_text_styles.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/login/login_state.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.state,
  });
  final LoginState state;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autovalidateMode;

  void _initFormAttributes() {
    _formKey = GlobalKey<FormState>();
    autovalidateMode = AutovalidateMode.disabled;
  }

  @override
  void initState() {
    _initFormAttributes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _disposeController();

    _disposeFocusNodes();
  }

  void _disposeFocusNodes() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  void _disposeController() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autovalidateMode,
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
            onEditingComplete: () =>
                FocusScope.of(context).requestFocus(_passwordFocusNode),
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Example@gmail.com',
            autofillHints: const [AutofillHints.email],
          ),
          const SizedBox(height: 38),
          Text(
            "password",
            style: AppTextStyles.textStyle16Regular
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(height: 9),
          CustomTextField(
            autofillHints: const <String>[AutofillHints.password],
            validate: (String? value) => Helper.validatePasswordField(value),
            focusNode: _passwordFocusNode,
            onSubmitted: (_) => _login(context),
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
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
          const SizedBox(height: 32),
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
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      BlocProvider.of<LoginCubit>(context).userSignIn(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
