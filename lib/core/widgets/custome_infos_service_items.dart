import 'package:flutter/material.dart';
// import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service.dart';
// import 'package:intl/intl.dart' as format;

class CustomeInfosServiceItems extends StatelessWidget {
  const CustomeInfosServiceItems({
    super.key,
    required this.date,
    required this.time,
    this.location,
    this.phone,
    this.onPressedDate,
    this.onPressedTime,
    this.onPressedLocation,
    this.dateTapped = false,
    this.timeTapped = false,
  });
  final String time;
  final void Function()? onPressedTime;
  final bool timeTapped;

  final String? location;
  final void Function()? onPressedLocation;

  final String date;
  final void Function()? onPressedDate;
  final bool dateTapped;

  final String? phone;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomeInfosService(
                    text: date,
                    icon: Icons.date_range_rounded,
                    onPressed: onPressedDate,
                    tapped: dateTapped,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomeInfosService(
                    text: time,
                    icon: Icons.alarm,
                    onPressed: onPressedTime,
                    tapped: timeTapped,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            location != null
                ? CustomeInfosService(
                    text: location!,
                    icon: Icons.location_on_outlined,
                    onPressed: onPressedLocation,
                  )
                : CustomeInfosService(
                    text: phone!,
                    icon: Icons.phone,
                  ),
          ],
        ),
      ),
    );
  }
}
