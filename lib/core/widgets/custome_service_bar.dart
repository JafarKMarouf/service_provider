import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Image.asset(
              'assets/png/img_bookmark.png',
            ),
            Image.asset(
              'assets/png/img_save.png',
            ),
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
            'assets/images/img_arrow_right.svg',
            width: 34,
            // height: 40,
          ),
          // icon: const Icon(Icons.arrow_back_rounded)
        ),
      ],
    );
  }
}
