import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_grid_view.dart';

class ServiceListBody extends StatelessWidget {
  const ServiceListBody({
    super.key,
    required this.data,
  });
  final List<DatumService> data;
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
          const CustomeServiceBar(title: 'title'),
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
