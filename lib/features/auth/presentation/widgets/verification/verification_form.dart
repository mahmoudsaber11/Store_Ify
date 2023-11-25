import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:store_ify/core/utils/app_colors.dart';
import 'package:store_ify/core/widgets/custom_circular_progress_indicator.dart';
import 'package:store_ify/core/widgets/custom_general_button.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_cubit.dart';
import 'package:store_ify/features/auth/presentation/cubits/verification/verification_state.dart';

class VerificationForm extends StatefulWidget {
  const VerificationForm({
    super.key,
    required this.email,
  });
  final String email;

  @override
  State<VerificationForm> createState() => _VerificationFormState();
}

class _VerificationFormState extends State<VerificationForm> {
  final TextEditingController _otpController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Pinput(
              controller: _otpController,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: PinTheme(
                width: 52.w,
                height: 52.w,
                textStyle: TextStyle(
                  fontSize: 22.sp,
                  color: AppColors.textColor,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(19).w,
                  border: Border.all(color: AppColors.primaryColor),
                ),
              ),
              separatorBuilder: (index) => SizedBox(width: 34.w),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Pin Is Empty";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 40.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: BlocBuilder<VerificationCubit, VerificationState>(
              builder: (context, state) {
                if (state is LoadingVerificationState) {
                  return const CustomCircularProgressIndicator();
                } else {
                  return CustomGeneralButton(
                    text: 'Verify',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        BlocProvider.of<VerificationCubit>(context)
                            .otpVerification(
                          email: widget.email,
                          forgetCode: _otpController.text,
                        );
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
