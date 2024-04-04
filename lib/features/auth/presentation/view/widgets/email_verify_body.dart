import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/custome_text_form_field.dart';

class EmailVerifyBody extends StatefulWidget {
  const EmailVerifyBody({super.key});

  @override
  State<EmailVerifyBody> createState() => _EmailVerifyBodyState();
}

class _EmailVerifyBodyState extends State<EmailVerifyBody> {
  final TextEditingController emailAddress = TextEditingController();
  bool _isResendAgain = false;
  late Timer timer;

  int _start = 60;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'أدخل رمز التحقق المكون من 6 أرقام والذي تم إرساله إلى بريدك الإلكتروني.',
              // 'Enter the 6-digit verification code that was sent to your email.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                fontWeight: FontWeight.w600,
              ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 48,
            ),
            CustomeTextFormField(
              type: TextInputType.emailAddress,
              isSuffix: false,
              dir: false,
              hintText: 'jfrmarouf@gmail.com',
              prefixIcon: Icons.email,
              customController: emailAddress,
              onChange: (val) {
                emailAddress.text = val;
                setState(
                  () {},
                );
              },
              // onSubmit: (val){
              //
              // },
            ),
            const SizedBox(
              height: 48,
            ),
            OtpTextField(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              numberOfFields: 6,
              borderColor: kPrimaryColor,
              showFieldAsBox: true,
              fieldHeight: 75,
              fieldWidth: MediaQuery.of(context).size.width / 8,
              cursorColor: kPrimaryColor,
              borderRadius: BorderRadius.circular(13),
              obscureText: false,
              keyboardType: TextInputType.number,
              onSubmit: (String otp) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Email Verification'),
                    content: Text(
                      'Code entered is $otp',
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    if (_isResendAgain) return;
                    resend();
                  },
                  child: Text(
                    _isResendAgain ? "s $_start" : "إعادة الإرسال",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  "ألم تتلقى الكود ؟",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade500,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            CustomButton(
              title: 'تقدم',
              width: MediaQuery.of(context).size.width,
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
