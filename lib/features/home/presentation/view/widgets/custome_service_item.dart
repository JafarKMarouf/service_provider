import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
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
              child: (data.photo == null)
                  ? Image.asset('assets/images/profile.png')
                  : FadeInImage.assetNetwork(
                      placeholder: 'asd',
                      image: ('${data.photo}'),
                    ),
              // child: Image.network('${data.photo}')
              // child: Text('${data.photo}'),
              // child: Image.network('${data.photo}'),
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
