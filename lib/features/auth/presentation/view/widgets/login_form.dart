import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancer_app/constant.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "تسجيل الدخول",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          CustomeTextFormField(
            prefixIcon: Icons.email,
            isSuffix: false,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            title: 'الايميل',
            customController: emailAddress,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomeTextFormField(
            isObscure: passwordVisible,
            prefixIcon: FontAwesomeIcons.lock,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              if (value.length < 8) {
                return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
              }
              return null;
            },
            title: 'كلمة السر',
            customController: password,
            type: TextInputType.visiblePassword,
            isSuffix: true,
            suffixIcon: passwordVisible
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            onPressedSuffix: () {
              passwordVisible = !passwordVisible;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'تذكر كلمة السر',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
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
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('');
            },
            child: const Text(
              'أعد تعيين كلمة السر',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
