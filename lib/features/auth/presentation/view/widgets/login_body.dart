import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_nav_bar.dart';
import 'package:freelancer_app/features/auth/data/models/user_model/user.dart';
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
              content: Text(state.errorMessage),
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (state is AuthSuccess) {
          loading = false;
          User user = state.userModel.data!.user!;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${user.name} is Logged Successfully'),
              duration: const Duration(seconds: 3),
            ),
          );
          Future.delayed(
            const Duration(microseconds: 250),
            () {
              Get.offAll(
                () => const CustomeNavBar(),
                transition: g.Transition.fadeIn,
                duration: kDurationTransition,
                arguments: user.name,
              );
            },
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: loading,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.5,
                    ),
                    const Expanded(
                      child: Text(
                        "تسجيل الدخول",
                        style: TextStyle(
                          fontFamily: 'Poppins SemiBold',
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          const LoginForm(),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              'أعد تعيين كلمة السر',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
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
                                color: AppColors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins SemiBold',
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const Text(
                            'ليس لديك حساب؟',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.dustyGray,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
