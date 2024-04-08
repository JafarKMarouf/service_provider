import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            "إنشاء حساب",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomeTextFormField(
            isSuffix: false,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              return null;
            },
            prefixIcon: Icons.person,
            hintText: 'اسم المستخدم',
            customController: name,
            type: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
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
            hintText: 'الإيميل',
            customController: emailAddress,
            type: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomeTextFormField(
            prefixIcon: Icons.lock,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              if (value.length < 8) {
                return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
              }
              return null;
            },
            hintText: 'كلمة السر',
            customController: password,
            type: TextInputType.visiblePassword,
            isSuffix: true,
            onPressedSuffix: () {
              passwordVisible = !passwordVisible;
              setState(() {});
            },
            suffixIcon: passwordVisible
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            isObscure: !passwordVisible,

          ),
          const SizedBox(
            height: 20,
          ),
          CustomeTextFormField(
            prefixIcon: Icons.lock,
            isObscure: !passwordVisibleConfirm,
            validate: (value) {
              if (value!.isEmpty) {
                return "هذا الحقل مطلوب";
              }
              if (value.length < 8) {
                return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
              }
              return null;
            },
            hintText: 'أعد كتابة كلمة السر',
            customController: passwordConfirm,
            type: TextInputType.visiblePassword,
            isSuffix: true,
            suffixIcon: passwordVisibleConfirm
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            onPressedSuffix: () {
              passwordVisibleConfirm = !passwordVisibleConfirm;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Row(
          //       children: [
          //         Radio(
          //           value: 'customer',
          //           groupValue: userRoleType,
          //           onChanged: (val) {
          //             userRoleType = val as String;
          //             setState(() {});
          //           },
          //         ),
          //         const Text(
          //           'زبون',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w800,
          //             fontSize: 20,
          //             color: Color(0xff252525),
          //           ),
          //         ),
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Radio(
          //           value: 'expert',
          //           groupValue: userRoleType,
          //           onChanged: (val) {
          //             userRoleType = val as String;
          //             setState(() {});
          //           },
          //         ),
          //         const Text(
          //           'خبير',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w800,
          //             fontSize: 20,
          //             color: Color(0xff252525),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 30,
          ),
          CustomButton(
            width: MediaQuery.of(context).size.width,
            onTap: () {
              if (formKey.currentState!.validate()) {
                BlocProvider.of<AuthCubit>(context).register(
                  username: name.text,
                  email: emailAddress.text,
                  password: password.text,
                  passwordConfirm: passwordConfirm.text,
                  // role: userRoleType,
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
    );
  }
}
