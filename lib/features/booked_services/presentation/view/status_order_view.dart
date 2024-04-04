import 'package:flutter/material.dart';
import 'package:freelancer_app/views/widgets/status_order_body.dart';

class StatusOrderView extends StatelessWidget {
  const StatusOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: StatusOrderBody(),
    );
  }
}
