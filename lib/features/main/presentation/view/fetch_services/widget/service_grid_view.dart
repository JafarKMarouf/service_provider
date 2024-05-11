import 'package:flutter/material.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/custome_service_item.dart';

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({
    super.key,
    required this.data,
  });
  final List<DatumService> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.length < 3 ? 135 : 260,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return CustomeServiceItem(
            data: data[index],
          );
        },
      ),
    );
  }
}
