import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CustomeProfileBar extends StatelessWidget {
  const CustomeProfileBar({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(AppImages.bookmark, color: kPrimaryColor),
            Image.asset(AppImages.save, color: kPrimaryColor),
          ],
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 16,
          ),
          textDirection: TextDirection.rtl,
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.exit_to_app,
            color: kPrimaryColor,
            size: 32,
          ),
        )
      ],
    );
  }
}
