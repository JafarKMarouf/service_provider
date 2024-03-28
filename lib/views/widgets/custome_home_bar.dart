import 'package:flutter/material.dart';

class CustomeHomeBar extends StatelessWidget {
  const CustomeHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.grey[200]),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 32,
                color: Colors.grey[500],
              )),
        ),
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'مرحبا',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'جعفر معروف',
                  style: TextStyle(),
                ),
              ],
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
                radius: 32,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/profile.png'))
                // child: Image.asset('assets/images/profile.png'),
                ),
          ],
        )
      ],
    );
  }
}
