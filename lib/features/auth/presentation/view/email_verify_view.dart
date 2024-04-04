import 'package:flutter/material.dart';
import 'package:freelancer_app/features/auth/presentation/view/widgets/email_verify_body.dart';
import 'package:get/get.dart';

class EmailVerifyView extends StatelessWidget {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'تأكيد بواسطة البريد الالكتروني',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          // textDirection: TextDirection.rtl,
        ),

      ),
      body: const EmailVerifyBody(),
    );
  }
}
