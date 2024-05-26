import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isShow = true;

  TextEditingController name = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  bool passwordVisible = false;
  bool passwordVisibleConfirm = false;

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  String userRoleType = 'customer';
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
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
              customController: name,
              type: TextInputType.text,
              suffix: const Icon(
                Icons.person_3_outlined,
                color: AppColors.dustyGray,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomeTextFormField(
              isSuffix: false,
              validate: (value) {
                if (value!.isEmpty) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
              hintText: 'الإيميل',
              customController: emailAddress,
              type: TextInputType.emailAddress,
              suffix: const Icon(
                Icons.email_outlined,
                color: AppColors.dustyGray,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomeTextFormField(
              hintText: 'كلمة السر',
              customController: password,
              type: TextInputType.visiblePassword,
              isSuffix: true,
              isObscure: !passwordVisible,
              suffix: Image.asset(AppImages.lock),
              prefix: InkWell(
                onTap: () {
                  passwordVisible = !passwordVisible;
                  setState(() {});
                },
                child: !passwordVisible
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
            const SizedBox(
              height: 20,
            ),
            CustomeTextFormField(
              hintText: 'أعد كتابة كلمة السر',
              customController: password,
              type: TextInputType.visiblePassword,
              isSuffix: true,
              isObscure: !passwordVisibleConfirm,
              suffix: Image.asset(AppImages.lock),
              prefix: InkWell(
                onTap: () {
                  passwordVisibleConfirm = !passwordVisibleConfirm;
                  setState(() {});
                },
                child: !passwordVisibleConfirm
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
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              color: AppColors.primary,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).register(
                    username: name.text,
                    email: emailAddress.text,
                    password: password.text,
                    passwordConfirm: passwordConfirm.text,
                  );
                } else {
                  autoValidate = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: "إنشاء حساب",
            ),
          ],
        ),
      ),
    );
  }
}
