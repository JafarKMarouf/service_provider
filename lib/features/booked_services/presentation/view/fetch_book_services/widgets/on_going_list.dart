import 'package:flutter/material.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/fetch_book_services/widgets/book_service_info_minimum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/show_book_service/booking_infos_view.dart';
import 'package:get/get.dart';

class OnGoingList extends StatelessWidget {
  final DatumBooked data;

  const OnGoingList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(
            () => BookingInfosView(data: data),
            transition: Transition.fadeIn,
            duration: kDurationTransition,
          );
        },
        child: BookServiceInfosMinimum(data: data));
  }
}
