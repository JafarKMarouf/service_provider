import 'package:flutter/material.dart';

import 'custome_services_bar.dart';
import 'on_going_list.dart';

class BookedServicesBody extends StatelessWidget {
  const BookedServicesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 60,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomeServicesBar(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'الخدمات المحجوزة',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 12,
              itemBuilder: (context, index) {
                return const OnGoingList();
              },
            ),
          )
        ],
      ),
    );
  }
}
