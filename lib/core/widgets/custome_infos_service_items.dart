import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service.dart';

class CustomeInfosServiceItems extends StatelessWidget {
  const CustomeInfosServiceItems({
    super.key,
    required this.date,
    required this.time,
    required this.location,
  });
  final String time;
  final String location;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32,
        bottom: 16,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeInfosService(
            text: location,
            icon: Icons.location_on_outlined,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomeInfosService(
                text: date,
                icon: Icons.date_range_rounded,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomeInfosService(
                text: time,
                icon: Icons.alarm,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
