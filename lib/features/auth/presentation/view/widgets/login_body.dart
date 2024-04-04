// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/features/auth/presentation/view/register_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/login_form.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/route_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
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
                seconds: 3,
              ),
            ),
          );
        } else if (state is AuthSuccess) {
          loading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  '${state.userModel.data!.user!.role} Your Logged Successfully'),
              duration: const Duration(
                seconds: 3,
              ),
            ),
          );
          Future.delayed(
            const Duration(microseconds: 250),
            () {
              Get.to(
                () => const CustomeNavBar(),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
              );
            },
          );
          print(state.userModel);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: Container(
            padding: const EdgeInsets.only(
              top: 120,
              bottom: 30,
              left: 24,
              right: 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LoginForm(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(
                            () => const RegisterView(),
                            transition: g.Transition.fadeIn,
                          );
                        },
                        child: const Text(
                          'إنشاء حساب',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Text(
                        'ليس لديك حساب؟',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(
                            0xff9E9D9D,
                          ),
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
