import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service.dart';

class CustomeInfosServiceItems extends StatelessWidget {
  const CustomeInfosServiceItems({
    super.key,
    required this.date,
    required this.time,
    this.location,
    this.phone,
  });
  final String time;
  final String? location;
  final String date;
  final String? phone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Column(
        children: [
          location != null
              ? CustomeInfosService(
                  text: location!,
                  icon: Icons.location_on_outlined,
                )
              : CustomeInfosService(
                  text: phone!,
                  icon: Icons.phone,
                ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Expanded(
                child: CustomeInfosService(
                  text: date,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2024),
                    );
                  },
                  icon: Icons.date_range_rounded,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: CustomeInfosService(
                  text: time,
                  icon: Icons.alarm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
