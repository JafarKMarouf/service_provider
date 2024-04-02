import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/custome_button.dart';
import 'package:freelancer_app/views/widgets/custome_service_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_service_book_info.dart';
import 'package:freelancer_app/views/widgets/custome_service_infos.dart';
import 'package:freelancer_app/views/widgets/display_location.dart';
import 'package:freelancer_app/views/widgets/service_type.dart';

class DescServiceBody extends StatelessWidget {
  const DescServiceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(vertical: 60.0, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           const CustomeServiceAppBar(title: "وصف الخدمة"),
          const ServiceType(),
          const CustomeServiceBookInfoItems(),
          const DisplayLocation(),
          const CustomeServiceInfo(
              price: '9000',
              description: 'تتضمن خدمة العملاء إجراءات، مثل تقد'
                  'يم اقتراحات المنتجات أو استكشاف '
                  'المشكلات والشكاوى وحلها أو الرد ع'
                  'لى الأسئلة العامة.'
          ),
          CustomButton(title: 'title',onTap: (){},width: MediaQuery.of(context).size.width,)
        ],
      ),
    );
  }
}
