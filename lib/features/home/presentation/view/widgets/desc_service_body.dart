import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';

import 'package:freelancer_app/features/booked_services/presentation/view/widgets/display_location.dart';
import 'package:freelancer_app/features/home/presentation/view/freelancer_infos_view.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_type.dart';
import 'package:get/get.dart' as g;

class DescServiceBody extends StatelessWidget {
  const DescServiceBody({
    super.key,
    required this.data,
  });
  final DatumService data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const CustomeServiceBar(
              title: "وصف الخدمة",
            ),
            ServiceType(
              data: data,
            ),
            CustomeInfosServiceItems(
              date: 'احجز تاريخاً للخدمة',
              onPressedDate: () async {
                await showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2034),
                );
              },
              time: 'اختيار الوقت',
              onPressedTime: () async {
                await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              location: 'تحديد الموقع',
            ),
            const DisplayLocation(),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'رسوم الفحص: ${data.price} ل.س ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'الوصف :   ${data.serviceDescription}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              title: 'تقدم',
              onTap: () {
                Future.delayed(
                  const Duration(microseconds: 250),
                  () {
                    g.Get.to(
                      () => FreelancerInfosView(
                        expert: data.expert,
                      ),
                      transition: g.Transition.fadeIn,
                      duration: kDurationTransition,
                    );
                  },
                );
              },
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}
