// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/route_manager.dart';
import 'package:pinput/pinput.dart';

class EmailVerifyBody extends StatefulWidget {
  const EmailVerifyBody({super.key});

  @override
  State<EmailVerifyBody> createState() => _EmailVerifyBodyState();
}

class _EmailVerifyBodyState extends State<EmailVerifyBody> {
  // getEmail();
  // Future getEmail() async {
  //   await cubit.getEmail();
  // }
  // final cubit = BlocProvider.of<AuthCubit>(context);

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            Text(
              'أدخل رمز التحقق المكون من 6 أرقام والذي تم إرساله إلى بريدك الإلكتروني.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthLoading) {
                  cubit.loadingVerify = true;
                } else if (state is AuthFailure) {
                  cubit.loadingVerify = false;
                  Get.snackbar('failed', state.errorMessage);
                } else if (state is AuthSuccess) {
                  // User user = state.userModel.data!.user!;
                  cubit.loadingVerify = false;
                  Get.snackbar('success', state.userModel.message!);

                  Get.offAll(
                    () => const LoginView(),
                    transition: g.Transition.fadeIn,
                    duration: kDurationTransition,
                  );
                }
              },
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
                        // onChange: (val) {
                        //   cubit.emailAddressVerify.text = val;
                        // },
                      ),
                      const SizedBox(height: 48),
                      Pinput(
                        controller: cubit.otpCodeVerify,
                        length: 6,
                        closeKeyboardWhenCompleted: true,
                        keyboardType: TextInputType.number,
                        pinAnimationType: PinAnimationType.fade,
                        animationCurve: accelerateEasing,
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
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        title: 'تقدم',
                        width: MediaQuery.of(context).size.width,
                        onTap: () async {
                          if (cubit.formKeyVerify.currentState!.validate()) {
                            await cubit.verify(
                              email: cubit.emailAddressVerify.text,
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
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // BlocBuilder<AuthCubit, AuthState>(
                //   builder: (context, state) {
                //     return TextButton(
                //       onPressed: () async {
                //         await cubit.resend();
                //       },
                //       child: cubit.loadingVerify
                //           ? const CircularProgressIndicator()
                //           : Text(
                //               cubit.isResendAgain
                //                   ? "s ${cubit.start}"
                //                   : "إعادة الإرسال",
                //               style: const TextStyle(
                //                 color: kPrimaryColor,
                //                 fontWeight: FontWeight.w700,
                //                 fontSize: 16,
                //               ),
                //             ),
                //     );
                //   },
                // ),
                Text(
                  "ألم تتلقى الكود ؟",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
