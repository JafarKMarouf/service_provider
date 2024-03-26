import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class BookServiceAppBar extends StatelessWidget {
  const BookServiceAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_rounded)
        ),
        const Text(
            'معلومات الحجز',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.send_outlined,size: 28,color: kPrimaryColor,),
            SizedBox(width: 8.0,),
            Icon(Icons.bookmark_border,size: 28,color: kPrimaryColor,),
          ],
        ),
      ],
    );
  }
}
