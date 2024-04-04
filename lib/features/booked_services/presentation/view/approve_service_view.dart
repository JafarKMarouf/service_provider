import 'package:flutter/material.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/approve_service_body.dart';

class ApproveServiceView extends StatelessWidget {
  const ApproveServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ApproveServiceBody(),
    );
  }
}
