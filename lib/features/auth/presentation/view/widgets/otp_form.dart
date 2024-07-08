import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:pinput/pinput.dart';

import 'custome_text_form_field.dart';

class OtpConfirmForm extends StatelessWidget {
  const OtpConfirmForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKeyVerify,
          autovalidateMode: cubit.autoValidateVerify,
          child: Column(
            children: [
              CustomeTextFormField(
                type: TextInputType.emailAddress,
                isSuffix: false,
                dir: false,
                hintText: cubit.email,
                prefix: Image.asset(AppImages.email, width: 34),
                customController: cubit.emailAddressVerify,
                readOnly: true,
              ),
              const SizedBox(height: 48),
              Pinput(
                controller: cubit.otpCodeVerify,
                length: 6,
                closeKeyboardWhenCompleted: true,
                keyboardType: TextInputType.number,
                pinAnimationType: PinAnimationType.fade,
                animationCurve: Easing.legacyAccelerate,
                animationDuration: const Duration(milliseconds: 200),
                defaultPinTheme: PinTheme(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 7,
                  decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    color: kPrimaryColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'otp code is required';
                  }
                  return null;
                },
                onSubmitted: (value) async {
                  if (cubit.formKeyVerify.currentState!.validate()) {
                    await cubit.verify(otp: cubit.otpCodeVerify.text);
                  } else {
                    cubit.autoValidateVerify = AutovalidateMode.always;
                  }
                },
                onCompleted: (value) async {
                  if (cubit.formKeyVerify.currentState!.validate()) {
                    await cubit.verify(otp: cubit.otpCodeVerify.text);
                  } else {
                    cubit.autoValidateVerify = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: 'تقدم',
                width: MediaQuery.of(context).size.width,
                onTap: () async {
                  if (cubit.formKeyVerify.currentState!.validate()) {
                    await cubit.verify(
                      otp: cubit.otpCodeVerify.text,
                    );
                  } else {
                    cubit.autoValidateVerify = AutovalidateMode.always;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
