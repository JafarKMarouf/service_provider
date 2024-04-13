import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/confirmed_booked_body.dart';

class ConfirmedBookedView extends StatelessWidget {
  const ConfirmedBookedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ConfirmedBookedBody(),
    );
  }
}
