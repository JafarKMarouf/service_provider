import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/book_service_type.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/display_location.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_service_infos.dart';

class BookingInfosBody extends StatelessWidget {
  const BookingInfosBody({
    super.key,
    required this.data,
  });

  final DatumBooked data;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40.0,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const CustomeServiceBar(title: "معلومات الحجز"),
            BookServiceType(data: data),
            const CustomeInfosServiceItems(
              date: '12/08/2023',
              // location: 'تحديد الموقع',
              time: '2-3 وقت الظهيرة',
            ),
            const DisplayLocation(),
            // const Spacer(),
            const CustomeServiceInfo(
              price: '9000',
              description: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
                  'يم اقتراحات المنتجات أو استكشاف '
                  'المشكلات والشكاوى وحلها أو الرد ع'
                  'لى الأسئلة العامة.',
            ),
            // const Spacer(),s
            CustomButton(
              title: 'تقدم',
              onTap: () {},
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
