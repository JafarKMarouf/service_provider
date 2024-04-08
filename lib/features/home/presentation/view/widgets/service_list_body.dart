import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_services_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/on_going_list.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_grid_view.dart';

class ServiceListbody extends StatelessWidget {
  const ServiceListbody({
    super.key,
    required this.data,
  });
  final List<Datum> data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 40,
        bottom: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomeServicesBar(),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'الخدمات المتاحة',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ServiceGridView(
              data: data,
            ),
          )
        ],
      ),
    );
  }
}
