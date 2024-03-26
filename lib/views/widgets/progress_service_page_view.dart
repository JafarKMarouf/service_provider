import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/progress_service_item.dart';

class ProgressServicePageView extends StatelessWidget {
  const ProgressServicePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      // width: 400,
      child: PageView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        reverse: true,
        itemBuilder: (context, index) {
          return const ProgressServiceItem();
        },
      ),
    );

  }
}
