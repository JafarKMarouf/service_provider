import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/features/auth/presentation/view/register_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/login_form.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:get/get.dart' as g;
import 'package:get/route_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          cubit.loadingLogin = true;
        } else if (state is AuthFailure) {
          cubit.loadingLogin = false;
          Get.snackbar('failed', state.errorMessage);
        } else if (state is AuthSuccess) {
          cubit.loadingLogin = false;
          // Get.snackbar('success', '${state.userModel.message}');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: cubit.loadingLogin,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Expanded(flex: 3, child: SizedBox()),
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
                const Expanded(flex: 4, child: LoginForm()),
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
        );
      },
    );
  }
}
