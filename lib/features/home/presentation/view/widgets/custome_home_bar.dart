import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';

class CustomeHomeBar extends StatelessWidget {
  const CustomeHomeBar({
    super.key,
    required this.name,
  });
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey[200],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
             Icons.notifications_active,
              size: 30,
              color: kPrimaryColor,
            ),
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'مرحبا',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                  fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
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
                child: Image.asset('assets/png/profile.png'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
