import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/freelancer_infos_body.dart';

class FreelancerInfosView extends StatelessWidget {
  const FreelancerInfosView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FreelancerInfosBody(),
    );
  }
}
