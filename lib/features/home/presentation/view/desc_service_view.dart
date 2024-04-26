import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/desc_service_body.dart';

class DescServiceView extends StatelessWidget {
  const DescServiceView({
    super.key,
    required this.data,
  });
  final DatumService data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DescServiceBody(
        data: data,
      ),
    );
  }
}
