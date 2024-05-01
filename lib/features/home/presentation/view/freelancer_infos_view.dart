import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/service.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/freelancer_infos_body.dart';

class FreelancerInfosView extends StatelessWidget {
  const FreelancerInfosView({
    super.key,
    required this.freelanceInfos,
  });
  final Service freelanceInfos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FreelancerInfosBody(
        freelanceInfos: freelanceInfos,
      ),
    );
  }
}
