import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_service_infos.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/display_location.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_type.dart';

class DescServiceBody extends StatelessWidget {
  const DescServiceBody({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomeServiceBar(title: "وصف الخدمة"),
            ServiceType(
              data: data,
            ),
            const CustomeInfosServiceItems(
              date: 'احجز تاريخاً للخدمة',
              location: 'تحديد الموقع',
              time: 'اختيار الوقت',
            ),
            const DisplayLocation(),
            CustomeServiceInfo(
              price: '${data.price!.toInt()}',
              description: '${data.serviceDescription}',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4.5,
            ),
            CustomButton(
              title: 'حجز',
              onTap: () {},
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
