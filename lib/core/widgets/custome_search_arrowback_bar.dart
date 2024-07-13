import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:get/get.dart';

class CustomeSearchArrowBackBar extends StatelessWidget {
  final String? title;
  const CustomeSearchArrowBackBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeSearch(width: 300, hintText: title),
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: SvgPicture.asset(AppImages.arrowright, width: 34),
        ),
      ],
    );
  }
}
