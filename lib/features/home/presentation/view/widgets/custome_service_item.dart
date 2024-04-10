import 'package:flutter/material.dart';
import 'package:freelancer_app/constant.dart';
import 'package:freelancer_app/features/home/presentation/view/desc_service_view.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:get/get.dart';

class CustomeServiceItem extends StatelessWidget {
  const CustomeServiceItem({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DescServiceView(
            data: data,
          ),
          transition: Transition.fadeIn,
          duration: kDurationTransition,
        );
      },
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              // child: FastCachedImage(url: '${data.photo}'),
              // // child: Cache,
              child: Image(
                image: NetworkImage('${data.photo}',scale: .5)
              ),
            ),
            Text(
              data.serviceName!,
              // 'تصليح',
              style: const TextStyle(
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
