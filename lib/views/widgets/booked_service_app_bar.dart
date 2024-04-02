import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // const CustomeSearch(
        //   width: 300,
        // ),
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              'assets/images/img_arrow_right.svg',
              width: 34,
            )),
      ],
    );
  }
}
