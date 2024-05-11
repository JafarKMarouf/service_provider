import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/freelancer_infos_view/widget/freelancer_infos_body.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_service/expert.dart'
    as books;
import 'package:freelancer_app/features/main/data/models/service_model/expert.dart'
    as service;

class FreelancerInfosView extends StatelessWidget {
  const FreelancerInfosView({
    super.key,
    this.freelanceInfos,
    this.expert,
  });
  final books.Expert? freelanceInfos;
  final service.Expert? expert;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FreelancerInfosBody(
        freelanceInfos: freelanceInfos,
        expert: expert,
      ),
    );
  }
}
