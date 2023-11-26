import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_ify/core/helpers/helper.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/utils/functions/show_toast.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/core/widgets/custom_text_field.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/reset_password/reset_password_state.dart';
import 'package:store_ify/features/auth/presentation/widgets/reset_password/login_dialog.dart';
import 'package:store_ify/features/auth/presentation/widgets/text_field_label.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key, required this.email});

  final String email;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  late final GlobalKey<FormState> _formKey;
  late AutovalidateMode autovalidateMode;

  String password = '';
  String confirmPassword = '';

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
    _disposeController();
    _disposeFocusNodes();
    super.dispose();
  }

  void _disposeController() {
    _passwordController.dispose();
    _confirmController.dispose();
  }

  void _disposeFocusNodes() {
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        _handleSuccessResetState(state, context, widget.email);
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TextFieldLabel(label: 'Password'),
              CustomTextField(
                isPassword: true,
                onChange: (value) {
                  setState(() {
                    password = value;
                  });
                },
                suffix: IconButton(
                  onPressed: () {
                    BlocProvider.of<ResetPasswordCubit>(context)
                        .changePasswordVisibility();
                  },
                  icon: Icon(
                    BlocProvider.of<ResetPasswordCubit>(context).isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                validate: (value) => Helper.validatePasswordField(value),
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                hintText: '*********',
                autofillHints: const <String>[AutofillHints.password],
                focusNode: _passwordFocusNode,
                onEditingComplete: () => FocusScope.of(context)
                    .requestFocus(_confirmPasswordFocusNode),
              ),
              SizedBox(height: 24.h),
              const TextFieldLabel(label: 'Confirm password'),
              CustomTextField(
                isPassword:
                    BlocProvider.of<ResetPasswordCubit>(context).isPassword,
                onChange: (value) {
                  setState(() {
                    confirmPassword = value;
                  });
                },
                validate: (value) => Helper.validateConfirmPasswordField(
                  value: value,
                  password: password,
                  confirmPassword: confirmPassword,
                ),
                suffix: IconButton(
                  onPressed: () {
                    BlocProvider.of<ResetPasswordCubit>(context)
                        .changePasswordVisibility();
                  },
                  icon: Icon(
                    BlocProvider.of<ResetPasswordCubit>(context).isPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.primaryColor,
                  ),
                ),
                controller: _confirmController,
                keyboardType: TextInputType.visiblePassword,
                hintText: '*********',
                onSubmitted: (_) => _resetPassword(context),
                autofillHints: const <String>[AutofillHints.password],
                focusNode: _confirmPasswordFocusNode,
              ),
              SizedBox(height: 28.h),
              state is LoadingResetPasswordState
                  ? const CustomCircularProgressIndicator()
                  : CustomGeneralButton(
                      text: 'Reset Password',
                      onPressed: () => _resetPassword(context),
                    ),
            ],
          ),
        );
      },
    );
  }

  void _resetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Helper.keyboardUnfocus(context);
      BlocProvider.of<ResetPasswordCubit>(context).resetPassword(
        email: widget.email,
        password: _passwordController.text,
        confirmPassword: _confirmController.text,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void _handleSuccessResetState(
    ResetPasswordState state,
    BuildContext context,
    String email,
  ) {
    if (state is SuccessResetPasswordState) {
      showDialog(
        context: context,
        builder: (context) {
          return LoginDialog(
            email: email,
            password: _passwordController.text,
          );
        },
      );
    }
    if (state is ErrorResetPasswordState) {
      showToast(text: state.errorMessage, state: ToastStates.error);
    }
  }
}
