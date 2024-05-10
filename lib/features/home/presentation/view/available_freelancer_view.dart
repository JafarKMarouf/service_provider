import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/available_freelancers_body.dart';

class AvailableFreelancerView extends StatelessWidget {
  const AvailableFreelancerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AvailableFreelancerBody(),
    );
  }
}

