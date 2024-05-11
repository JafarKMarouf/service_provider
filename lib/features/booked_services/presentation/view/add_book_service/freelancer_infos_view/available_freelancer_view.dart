import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/available_freelancers_body.dart';

class AvailableFreelancerView extends StatelessWidget {
  const AvailableFreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AvailableFreelancerBody(),
    );
  }
}

