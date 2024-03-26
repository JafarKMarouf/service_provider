import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class TypeServices extends StatelessWidget {
  const TypeServices
      ({super.key, required this.onPressed, required this.title,});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      TextButton(
        onPressed: onPressed,
        child:const Text(
          'رؤية الكل',
          style: TextStyle(
              color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Text(
        title,
        style:const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
      ),
    ]);
  }
}
