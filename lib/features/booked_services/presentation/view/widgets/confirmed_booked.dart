import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_style_service_infos.dart';

class ConfirmedBooked extends StatelessWidget {
  const ConfirmedBooked({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomeStyleServiceInfos(
          title: 'اسم الخدمة : ',
          info: 'تصليح مكيفات',
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: 'اسم الفريلانسر : ',
          info: 'هشام حداد',
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: 'التقييم :',
          rating: true,
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: ' رسوم الخدمة مكتملة : ',
          info: '9000 ل.س',
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: 'التاريخ : ',
          info: '2023/08/15',
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: ' وقت إكمال الخدمة : ',
          info: '08 مساء‘',
        ),
        SizedBox(
          height: 8,
        ),
        CustomeStyleServiceInfos(
          title: ' رفم الفريلانسر : ',
          info: '09344655435',
        ),
      ],
    );
  }
}
