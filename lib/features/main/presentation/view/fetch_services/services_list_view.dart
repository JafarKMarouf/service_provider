import 'package:flutter/material.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/service_list_body.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
    required this.data,
    this.loading = true,
  });
  final List<DatumService> data;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ServiceListBody(data: data),
    );
  }
}
