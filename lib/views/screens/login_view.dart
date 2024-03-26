import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/views/widgets/custome_button.dart';
import 'package:freelancer_app/views/widgets/custome_text_form_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isShow = true;

  TextEditingController emailAddress = TextEditingController();

  TextEditingController password = TextEditingController();
  bool loading = false;

  bool passwordVisible = false;
  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    CustomTextFormField(
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
                      // hintText: 'Enter your email',
                      type: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      isObsecure: passwordVisible,
                      // prefixIcon:Icons.lock ,
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
                      onTap: () {
                        if (formKey.currentState!.validate()) {
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
                      'انشاء حساب',
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
