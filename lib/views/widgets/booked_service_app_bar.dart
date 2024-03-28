import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelancer_app/views/widgets/custome_search.dart';

class BookedServiceAppBar extends StatelessWidget {
  const BookedServiceAppBar({
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
