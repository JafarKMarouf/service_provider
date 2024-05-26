import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/constants/app_colors.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';

import 'custome_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;

  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordVisible = false;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SingleChildScrollView(
        child: Column(
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
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'تذكير بكلمة السر',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff252525),
                  ),
                ),
                Checkbox(
                  value: check,
                  onChanged: (val) {
                    check = val!;
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              width: MediaQuery.of(context).size.width,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthCubit>(context).login(
                    email: emailAddress.text,
                    password: password.text,
                  );
                } else {
                  autoValidate = AutovalidateMode.always;
                  setState(() {});
                }
              },
              title: "تسجيل الدخول",
            ),
          ],
        ),
      ),
    );
  }
}
