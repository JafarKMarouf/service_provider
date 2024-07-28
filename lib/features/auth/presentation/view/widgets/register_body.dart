import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/email_verify_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/register_form.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          cubit.loadingRegister = true;
        } else if (state is AuthFailure) {
          cubit.loadingRegister = false;
          Get.snackbar('failed', state.errorMessage);
        } else if (state is AuthSuccess) {
          cubit.loadingRegister = false;
          Get.snackbar('success', '${state.userModel.message}');
          Future.delayed(
            const Duration(microseconds: 250),
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
          inAsyncCall: cubit.loadingRegister,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Expanded(flex: 2, child: SizedBox()),
                const Expanded(
                  child: Text(
                    "إنشاء حساب",
                    style: TextStyle(
                      fontFamily: 'Poppins SemiBold',
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(flex: 4, child: RegisterForm()),
                Expanded(
                  child: Row(
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
                            color: AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins SemiBold',
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const Text(
                        'لديك حساب بالفعل؟',
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
        );
      },
    );
  }
}
