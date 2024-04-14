import 'package:flutter/material.dart';
import 'package:freelancer_app/features/home/data/models/service_model/datum.dart';
import 'package:freelancer_app/features/home/presentation/view/widgets/service_list_body.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
    required this.data,
  });
  final List<Datum> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ServiceListBody(data:data),
    );
  }
}
