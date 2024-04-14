import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/custome_service_item.dart';

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({super.key, required this.data});
  final List<Datum> data;
  // int length = data.length/2;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
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
