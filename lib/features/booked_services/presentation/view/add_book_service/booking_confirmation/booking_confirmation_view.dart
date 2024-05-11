import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/booking_confirmation/widget/booking_confirmation_body.dart';

class BookingConfirmationView extends StatelessWidget {
  const BookingConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookingConfirmationBody(),
    );
  }
}