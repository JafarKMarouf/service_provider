import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomeIconService extends StatelessWidget {
  const CustomeIconService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: kPrimaryColor
      ),
      child: Image.network(''),
      // child: SvgPicture.asset('assets/images/img_button_google_primary.svg'),
    );
  }
}
