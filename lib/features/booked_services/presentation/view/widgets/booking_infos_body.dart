import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/display_location.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_service_infos.dart';

class BookingInfosBody extends StatelessWidget {
  const BookingInfosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12),
      child: Column(
        children: [
          const CustomeServiceBar(title: "معلومات الحجز"),
          // const ServiceType(data: 'data'),

          const CustomeInfosServiceItems(
            date: 'احجز تاريخاً للخدمة',
            location: 'تحديد الموقع',
            time: 'اختيار الوقت',
          ),
          DisplayLocation(),
          const Spacer(),
          const CustomeServiceInfo(
            price: '9000',
            description: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
                'يم اقتراحات المنتجات أو استكشاف '
                'المشكلات والشكاوى وحلها أو الرد ع'
                'لى الأسئلة العامة.',
          ),
          const Spacer(),
          CustomButton(
            title: 'تقدم',
            onTap: () {},
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
