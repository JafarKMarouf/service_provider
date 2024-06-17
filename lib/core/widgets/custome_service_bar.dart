import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';

class CustomeServiceBar extends StatelessWidget {
  const CustomeServiceBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(AppImages.bookmarksvg, height: 24, width: 24),
            SvgPicture.asset(AppImages.savesvg, height: 24, width: 24),
          ],
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
          textDirection: TextDirection.rtl,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            AppImages.arrowright,
            width: 34,
          ),
          // icon: const Icon(Icons.arrow_back_rounded)
        ),
      ],
    );
  }
}
