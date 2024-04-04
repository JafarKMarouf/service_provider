import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../home/presentation/view/widgets/custome_search.dart';

class CustomeServicesBar extends StatelessWidget {
  const CustomeServicesBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomeSearch(
          width: 300,
        ),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: SvgPicture.asset(
              'assets/images/img_arrow_right.svg',
              width: 34,
            ),),
      ],
    );
  }
}
