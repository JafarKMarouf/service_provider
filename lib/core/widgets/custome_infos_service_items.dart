import 'package:flutter/material.dart';
import 'package:freelancer_app/core/constants/app_images.dart';
// import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service.dart';
// import 'package:intl/intl.dart' as format;

class CustomeInfosServiceItems extends StatelessWidget {
  const CustomeInfosServiceItems({
    super.key,
    this.date,
    this.time,
    this.location,
    this.phone,
    this.onPressedDate,
    this.onPressedTime,
    this.onPressedLocation,
    this.dateTapped = false,
    this.timeTapped = false,
    this.locationTapped = false,
  });
  final String? time;
  final void Function()? onPressedTime;
  final bool timeTapped;

  final String? location;
  final void Function()? onPressedLocation;
  final bool locationTapped;

  final String? date;
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
                date != null
                    ? Expanded(
                        child: CustomeInfosService(
                          text: date!,
                          image: AppImages.calender,
                          onPressed: onPressedDate,
                          tapped: dateTapped,
                        ),
                      )
                    : Container(),
                const SizedBox(width: 8),
                time != null
                    ? Expanded(
                        child: CustomeInfosService(
                          text: time!,
                          image: AppImages.time,
                          onPressed: onPressedTime,
                          tapped: timeTapped,
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                location != null
                    ? Expanded(
                        child: CustomeInfosService(
                          image: AppImages.location,
                          text: location!,
                          tapped: locationTapped,
                          onPressed: onPressedLocation,
                        ),
                      )
                    : Container(),
                const SizedBox(width: 8),
                phone != null
                    ? Expanded(
                        child: CustomeInfosService(
                          text: phone!,
                          image: AppImages.phone,
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
