import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/utils/constant.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/service_infos_view.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:freelancer_app/features/main/presentation/view/fetch_services/widget/service_infos_minimum.dart';
import 'package:get/get.dart' as g;

class CustomeServiceItem extends StatelessWidget {
  final DatumService data;
  const CustomeServiceItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => g.Get.to(
        () => ServiceInfosView(data: data),
        transition: g.Transition.fadeIn,
        duration: kDurationTransition,
      ),
      child: ServiceInfosMinimum(data: data),
    );
  }
}
