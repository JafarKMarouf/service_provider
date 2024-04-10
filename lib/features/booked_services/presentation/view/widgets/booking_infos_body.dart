import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_service_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_service_book_info.dart';

class BookingInfosBody extends StatelessWidget {
  const BookingInfosBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 12),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomeServiceAppBar(title: "معلومات الحجز"),
          // const ServiceType(),
          SizedBox(
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 2),
              itemBuilder: (context, index) => const CustomeServiceBookInfo(
                text: 'asd',
                icon: Icons.add,
              ),
            ),
          ),
          // CustomeServiceBookInfoItems(),
          // const DisplayLocation(),
          // const CustomeServiceInfo(
          //     price: '9000',
          //     description: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
          //         'يم اقتراحات المنتجات أو استكشاف '
          //         'المشكلات والشكاوى وحلها أو الرد ع'
          //         'لى الأسئلة العامة.'),
          // CustomButton(
          //   title: 'تقدم',
          //   onTap: () {},
          //   width: MediaQuery.of(context).size.width,
          // )
        ],
      ),
    );
  }
}
