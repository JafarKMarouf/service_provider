import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class FetchServices extends StatelessWidget {
  const FetchServices({
    super.key,
    this.onPressed,
    required this.title,
    // required this.length,
  });
  final void Function()? onPressed;
  final String title;
  // final int length;
  @override
  Widget build(BuildContext context) {
    // print('================length : $length=================');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       // length > 0 ?
       TextButton(
          onPressed: onPressed,
          child: const Text(
            'رؤية الكل',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
           // : Container(),
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
