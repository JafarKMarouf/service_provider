import 'package:flutter/material.dart';
import 'widgets/booking_infos_body.dart';

class BookingInfosView extends StatelessWidget {
  const BookingInfosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookingInfosBody(),
    );
  }
}
