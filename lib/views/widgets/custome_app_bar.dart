import 'package:flutter/material.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

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
          // mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'جعفر معروف',
              style: TextStyle(),
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
