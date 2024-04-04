import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class EmailVerifyBody extends StatefulWidget {
  const EmailVerifyBody({super.key});

  @override
  State<EmailVerifyBody> createState() => _EmailVerifyBodyState();
}

class _EmailVerifyBodyState extends State<EmailVerifyBody> {
  final TextEditingController emailAddress = TextEditingController();
  bool _isResendAgain = false;
  late Timer timer;
  int _start = 60;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  var code = '';
  bool loading = false;
  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          loading = true;
        } else if (state is AuthFailure) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage,
              ),
              duration: const Duration(
                seconds: 2,
              ),
            ),
          );
        } else if (state is AuthSuccess) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.userModel.message!,
              ),
              duration: const Duration(
                seconds: 2,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              autovalidateMode: autoValidate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'أدخل رمز التحقق المكون من 6 أرقام والذي تم إرساله إلى بريدك الإلكتروني.',
                    // 'Enter the 6-digit verification code that was sent to your email.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w600,
                    ),
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  CustomeTextFormField(
                    type: TextInputType.emailAddress,
                    isSuffix: false,
                    dir: false,
                    hintText: '$email',
                    prefixIcon: Icons.email,
                    customController: emailAddress,
                    onChange: (val) {
                      emailAddress.text = val;
                      setState(
                        () {},
                      );
                    },
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  OtpTextField(
                    textStyle: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    numberOfFields: 6,
                    borderColor: kPrimaryColor,
                    showFieldAsBox: true,
                    fieldHeight: 75,
                    fieldWidth: MediaQuery.of(context).size.width / 8,
                    cursorColor: kPrimaryColor,
                    borderRadius: BorderRadius.circular(13),
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    onCodeChanged: (val) {
                      code = val;
                      setState(() {});
                    },
                    onSubmit: (otp) {
                      code = otp;
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          if (_isResendAgain) return;
                          resend();
                        },
                        child: Text(
                          _isResendAgain ? "s $_start" : "إعادة الإرسال",
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
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
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    title: 'تقدم',
                    width: MediaQuery.of(context).size.width,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (code != '') {
                          BlocProvider.of<AuthCubit>(context).verify(
                            email: email.toString(),
                            otp: code,
                          );
                          print('======email : $email =========');
                          print('======otp : $code =========');
                        }
                      } else {
                        autoValidate = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  )
                  // : const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
