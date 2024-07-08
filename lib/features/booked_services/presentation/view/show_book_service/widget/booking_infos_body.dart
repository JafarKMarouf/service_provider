import 'package:flutter/material.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/core/widgets/custome_infos_service_items.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/widget/book_service_type.dart';
import 'package:freelancer_app/core/widgets/display_location.dart';
import 'package:intl/intl.dart';

import 'custome_book_service_infos.dart';

class BookingInfosBody extends StatelessWidget {
  const BookingInfosBody({
    super.key,
    required this.data,
  });
  final DatumBooked data;
  @override
  Widget build(BuildContext context) {
    var formatDate = DateFormat('dd/MM/yyy').format(data.deliveryTime!);
    var formatTime = DateFormat('hh:mm aa').format(data.deliveryTime!);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const CustomeServiceBar(title: "معلومات الحجز"),
            BookServiceType(data: data),
            CustomeInfosServiceItems(
              date: formatDate,
              phone: data.service!.expert!.expertInfos!.mobile,
              time: formatTime,
            ),
            const DisplayLocation(),
            CustomeBookServiceInfo(data: data),
            CustomButton(
              title: 'تقدم',
              onTap: () {},
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
