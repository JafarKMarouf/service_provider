import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/booked_services_body.dart';

class BookedServicesListView extends StatelessWidget {
  const BookedServicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BookedServicesBody(),
    );
  }
}

