import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookServiceAppBar extends StatelessWidget {
  const BookServiceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/images/img_bookmark.svg'),
            // SizedBox(width: 8.0,),
            SvgPicture.asset('assets/images/send.svg'),
          ],
        ),

        const Text(
            'وصف الخدمة',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20
          ),
          textDirection: TextDirection.rtl,
        ),
        TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child:SvgPicture.asset(
              'assets/images/img_arrow_right.svg',
            width: 34,
            height: 34,
          ),
          // icon: const Icon(Icons.arrow_back_rounded)
        ),

      ],
    );
  }
}
