import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class FetchServices extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const FetchServices({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'رؤية الكل',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        // : Container(),
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
