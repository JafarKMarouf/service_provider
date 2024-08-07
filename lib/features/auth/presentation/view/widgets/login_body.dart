import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/features/auth/presentation/view/register_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/login_form.dart';
import 'package:get/get.dart' as g;
import 'package:get/route_manager.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
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
                    Get.off(
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
    );
  }
}
