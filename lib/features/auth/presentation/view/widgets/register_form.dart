import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Form(
          key: bloc.formKeyRegister,
          autovalidateMode: bloc.autoValidateRegister,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomeTextFormField(
                  isSuffix: false,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  // prefixIcon: Icons.person,
                  hintText: 'اسم المستخدم',
                  customController: bloc.usernameRegister,
                  type: TextInputType.text,
                  suffix: const Icon(
                    Icons.person_3_outlined,
                    color: AppColors.dustyGray,
                  ),
                ),
                const SizedBox(height: 20),
                CustomeTextFormField(
                  isSuffix: false,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                  hintText: 'الإيميل',
                  customController: bloc.emailAddressRegister,
                  type: TextInputType.emailAddress,
                  suffix: const Icon(
                    Icons.email_outlined,
                    color: AppColors.dustyGray,
                  ),
                ),
                const SizedBox(height: 20),
                CustomeTextFormField(
                  hintText: 'كلمة السر',
                  customController: bloc.passwordRegister,
                  type: TextInputType.visiblePassword,
                  isSuffix: true,
                  isObscure: !bloc.passwordVisibleRegister,
                  suffix: Image.asset(AppImages.lock),
                  prefix: InkWell(
                    onTap: () {
                      bloc.visibleRegister();
                    },
                    child: !bloc.passwordVisibleRegister
                        ? Image.asset(AppImages.visible)
                        : const Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.dustyGray,
                          ),
                  ),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    if (value.length < 8) {
                      return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomeTextFormField(
                  hintText: 'أعد كتابة كلمة السر',
                  customController: bloc.passwordConfirmRegister,
                  type: TextInputType.visiblePassword,
                  isSuffix: true,
                  isObscure: !bloc.passwordVisibleRegister,
                  suffix: Image.asset(AppImages.lock),
                  prefix: InkWell(
                    onTap: () {
                      bloc.visibleRegister();
                    },
                    child: !bloc.passwordVisibleRegister
                        ? Image.asset(AppImages.visible)
                        : const Icon(
                            Icons.remove_red_eye_rounded,
                            color: AppColors.dustyGray,
                          ),
                  ),
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "هذا الحقل مطلوب";
                    }
                    if (value.length < 8) {
                      return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primary,
                  onTap: () {
                    if (bloc.formKeyRegister.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context).register(
                        username: bloc.usernameRegister.text,
                        email: bloc.emailAddressRegister.text,
                        password: bloc.passwordRegister.text,
                        passwordConfirm: bloc.passwordConfirmRegister.text,
                      );
                    } else {
                      bloc.autoValidateRegister = AutovalidateMode.always;
                    }
                  },
                  title: "إنشاء حساب",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
