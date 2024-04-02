import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/utils/custome_button.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'custome_text_form_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordVisible = false;
  bool check = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child:  Container(
          padding: const EdgeInsets.only(
              top: 120,
              bottom: 30,
              left: 24,
              right: 24
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
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
                        // hintText: 'password',
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
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          Future.delayed(
                            const Duration(seconds: 4),
                                () {
                              Get.to(
                                    () => const (),
                                transition: Transition.zoom,
                                duration: kDurationTransition,
                              );
                            },
                          );
                          //
                          // if (formKey.currentState!.validate()) {
                          // } else {
                          //   autoValidate = AutovalidateMode.always;
                          //   setState(() {});
                          // }
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
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('register');
                      },
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text(
                      'ليس لديك حساب؟',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff9E9D9D),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
