import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/desc_service_view.dart';
import 'package:freelancer_app/views/widgets/custome_icon_service.dart';
import 'package:get/get.dart';

class CustomeServiceItem extends StatelessWidget {
  const CustomeServiceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => const DescServiceView(),
          transition: Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
      child: const Card(
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: CustomeIconService(),
            ),
            Text(
              'تصليح',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
