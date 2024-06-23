import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomeVerifyBar extends StatelessWidget {
  const CustomeVerifyBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width / 8),
        const Text(
          'تأكيد بواسطة البريد الالكتروني',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
