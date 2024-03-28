import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/on_going_service_list.dart';

class OnGoingServicePageView extends StatelessWidget {
  const OnGoingServicePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return const OnGoingServicesList();
        },
      ),
    );

  }
}
