import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_service_app_bar.dart';
import 'package:freelancer_app/views/widgets/custome_service_book_info.dart';
import 'package:freelancer_app/views/widgets/custome_service_infos.dart';
import 'package:freelancer_app/views/widgets/display_location.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_type.dart';

class DescServiceBody extends StatelessWidget {
  const DescServiceBody({
    super.key,
    required this.data,
  });
  final Datum data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomeServiceAppBar(title: "وصف الخدمة"),
          ServiceType(
            data: data,
          ),
          const CustomeServiceBookInfoItems(),
          const DisplayLocation(),
          CustomeServiceInfo(
            price: '${data.price!.toInt()}',
            description: '${data.serviceDescription}',
          ),
          CustomButton(
            title: 'حجز',
            onTap: () {},
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    );
  }
}
