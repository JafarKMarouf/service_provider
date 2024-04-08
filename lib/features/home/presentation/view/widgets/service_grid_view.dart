import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/custome_service_item.dart';

class ServiceGridView extends StatelessWidget {
  const ServiceGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      itemCount: 6,
      itemBuilder: (context, index) {
        return const CustomeServiceItem();
      },
    );
  }
}
