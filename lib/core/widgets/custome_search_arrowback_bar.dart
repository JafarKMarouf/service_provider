import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
import 'package:freelancer_app/core/widgets/custome_search.dart';
import 'package:get/get.dart';

class CustomeSearchArrowBackBar extends StatelessWidget {
  const CustomeSearchArrowBackBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomeSearch(width: 300),
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
