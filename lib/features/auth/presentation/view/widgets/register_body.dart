import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/auth/presentation/view/login_view.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/register_form.dart';
import 'package:get/get.dart' as g;
import 'package:get/get.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    g.Get.off(
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
    );
  }
}
