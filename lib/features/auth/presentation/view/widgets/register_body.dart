import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'custome_text_form_field.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isShow = true;

  TextEditingController name = TextEditingController();

  TextEditingController emailAddress = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  bool loading = false;
  bool passwordVisible = false;
  bool passwordVisibleConfirm = false;

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  int userRoleType = 1;


  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loading,
      child:Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
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
                        title: 'اسم المستخدم',
                        customController: name,
                        // hintText: 'Enter your name',
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
                        title: 'الإيميل',
                        customController: emailAddress,
                        // hintText: 'Enter your email',
                        type: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomeTextFormField(
                        isObscure: passwordVisible,
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
                        height: 20,
                      ),
                      CustomeTextFormField(
                        prefixIcon: Icons.lock,
                        isObscure: passwordVisibleConfirm,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          if (value.length < 8) {
                            return 'كلمة السر يجب ان تحتوي 8 حروف على الأقل';
                          }
                          return null;
                        },
                        title: 'أعد كتابة كلمة السر',
                        customController: passwordConfirm,
                        // hintText: 'password confirm',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Radio(
                              value: 1,
                              groupValue: userRoleType,
                              onChanged: (val) {
                                userRoleType = val as int;
                                setState(() {});
                              },
                            ),
                            const Text(
                              'Customer',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff252525)),
                            ),
                          ]),
                          Row(children: [
                            Radio(
                              value: 2,
                              groupValue: userRoleType,
                              onChanged: (val) {
                                userRoleType = val as int;
                                setState(() {});
                              },
                            ),
                            const Text(
                              'Freelancer',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color(0xff252525),
                              ),
                            ),
                          ]),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('login');
                      },
                      child: const Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const Text(
                      'لديك حساب بالفعل؟',
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
