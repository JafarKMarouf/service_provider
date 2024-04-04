import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/email_verify_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/register_form.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
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
            const SnackBar(
              content: Text(
                'verification code has been sent to your email,please check you box',
              ),
              duration: Duration(
                seconds: 2,
              ),
            ),
          );
          Future.delayed(
            const Duration(
              microseconds: 250,
            ),
            () {
              g.Get.to(
                () => const EmailVerifyView(),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
                arguments: state.userModel.data!.user!.email,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const RegisterForm(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          g.Get.to(
                            () => const LoginView(),
                            transition: g.Transition.fadeIn,
                            duration: kDurationTransition,
                          );
                        },
                        child: const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Text(
                        'لديك حساب بالفعل؟',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff9E9D9D),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
