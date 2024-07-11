import 'package:flutter/material.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/custome_service_item.dart';

class ServicesGridView extends StatelessWidget {
  final List<DatumService> data;

  const ServicesGridView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: data.length < 3 ? 135 : 260,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        padding: const EdgeInsets.only(top: 15, bottom: 10),
        itemCount: data.length,
        itemBuilder: (context, index) => CustomeServiceItem(data: data[index]),
      ),
    );
  }
}
