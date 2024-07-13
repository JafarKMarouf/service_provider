import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/widget/book_service_init.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';

import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service.dart'
    as servicemodel;

class ServiceInfosView extends StatelessWidget {
  final DatumService data;
  const ServiceInfosView({super.key, required this.data});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => PickBookServiceInfosCubit(),
        child: Scaffold(body: BookServiceInit(data: data)),
      );
}
