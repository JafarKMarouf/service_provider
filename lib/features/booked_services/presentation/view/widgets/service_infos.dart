import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_style_service_infos.dart';

class ServiceInfos extends StatelessWidget {
  const ServiceInfos({super.key});
  // final String freelancerName;
  // final String serviceName;
  // final String bookedDate;
  // final String finishedDate;
  // final String startTime;
  // final String finishedTime;
  // final String price;
  // final String description;
  // final String

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomeStyleServiceInfos(
          title: 'اسم الفريلانسر : ',
          info: 'هشام حداد',
        ),
        CustomeStyleServiceInfos(
          title: 'اسم الخدمة : ',
          info: 'تصليح مكيفات',
        ),
        CustomeStyleServiceInfos(
          title: 'تاريخ الحجز : ',
          info: '2023 - 08 - 09',
        ),
        CustomeStyleServiceInfos(
          title: 'تاريخ الخدمة : ',
          info: '2023 - 08 - 15',
        ),
        CustomeStyleServiceInfos(
          title: ' الوقت : ',
          info: '09 مساء‘',
        ),
        CustomeStyleServiceInfos(
          title: ' رسوم الخدمة مكتملة : ',
          info: '9000 ل.س',
        ),
        CustomeStyleServiceInfos(
          title: ' حالة المكيف قبل الإصلاح : ',
          image3: 'assets/images/img_rectangle_17_108x145.png',
          image2: 'assets/images/img_rectangle_18.png',
          image1: 'assets/images/img_rectangle_17.png',
        ),
        // SizedBox(height: 8,),
        CustomeStyleServiceInfos(
          title: ' حالة المكيف بعد الإصلاح : ',
          image3: 'assets/images/img_rectangle_17_108x145.png',
          image2: 'assets/images/img_rectangle_18.png',
          image1: 'assets/images/img_rectangle_17.png',
        ),
      ],
    );
  }
}
