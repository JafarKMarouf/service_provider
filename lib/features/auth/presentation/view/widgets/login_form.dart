import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

import 'custome_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: bloc.formKeyLogin,
          autovalidateMode: bloc.autoValidateLogin,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomeTextFormField(
                  isSuffix: false,
                  validate: (value) {
                    if (value!.isEmpty) return "هذا الحقل مطلوب";
                    return null;
                  },
                  hintText: 'الإيميل',
                  customController: bloc.emailAddressLogin,
                  type: TextInputType.emailAddress,
                  suffix: const Icon(
                    Icons.email_outlined,
                    color: AppColors.dustyGray,
                  ),
                ),
                const SizedBox(height: 20),
                CustomeTextFormField(
                  hintText: 'كلمة السر',
                  customController: bloc.passwordLogin,
                  type: TextInputType.visiblePassword,
                  isSuffix: true,
                  isObscure: !bloc.passwordVisibleLogin,
                  suffix: Image.asset(AppImages.lock),
                  prefix: InkWell(
                    onTap: () => bloc.visibleLogin(),
                    child: !bloc.passwordVisibleLogin
                        ? Image.asset(AppImages.visible)
                        : const Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.dustyGray,
                          ),
                  ),
                  validate: (value) {
                    if (value!.isEmpty) return "هذا الحقل مطلوب";

                    if (value.length < 8) {
                      return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  onTap: () {
                    if (bloc.formKeyLogin.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).login(
                        email: bloc.emailAddressLogin.text,
                        password: bloc.passwordLogin.text,
                      );
                    } else {
                      bloc.autoValidateLogin = AutovalidateMode.always;
                    }
                  },
                  title: "تسجيل الدخول",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
