import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';

class CustomeServiceItem extends StatelessWidget {
  const CustomeServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: kPrimaryColor),
              child: const Icon(
                Icons.settings,
                size: 40,
                color: Colors.white,
              ),
            ),
          ),
          const Text(
              'تصليح',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
