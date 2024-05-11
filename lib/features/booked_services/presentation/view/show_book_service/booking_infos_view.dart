import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/datum_booked.dart';
import 'widget/booking_infos_body.dart';

class BookingInfosView extends StatelessWidget {
  const BookingInfosView({
    super.key,
    required this.data,
  });
  final DatumBooked data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookingInfosBody(
        data: data,
      ),
    );
  }
}
