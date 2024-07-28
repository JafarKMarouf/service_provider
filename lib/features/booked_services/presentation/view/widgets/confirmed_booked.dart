import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/features/booked_services/data/models/book_services/book_datum.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/widgets/custome_style_service_infos.dart';
import 'package:freelancer_app/features/main/data/models/service_model/service_model.dart';
import 'package:freelancer_app/features/main/presentation/view_models/service_cubit/service_cubit.dart';

class ConfirmedBooked extends StatelessWidget {
  final DatumBooked booked;
  const ConfirmedBooked({super.key, required this.booked});
  @override
  Widget build(BuildContext context) {
    log('====${booked.serviceId}');
    // BlocProvider.of<ServiceCubit>(context)
    //     .showService(serviceId: booked.serviceId);

    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        if (state is ServiceSuccess) {
          ServiceModel service = state.service;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomeStyleServiceInfos(
                title: 'اسم الخدمة : ',
                info: service.data![0].serviceName,
                // info: 'تصليح مكيفات',
              ),
              const SizedBox(height: 8),
              CustomeStyleServiceInfos(
                title: 'اسم الفريلانسر : ',
                info: service.data![0].expert!.first.user!.name,

                // info: 'هشام حداد',
              ),
              const SizedBox(height: 8),
              const CustomeStyleServiceInfos(title: 'التقييم :', rating: true),
              const SizedBox(height: 8),
              const CustomeStyleServiceInfos(
                title: ' رسوم الخدمة مكتملة : ',
                info: '9000 ل.س',
              ),
              const SizedBox(height: 8),
              const CustomeStyleServiceInfos(
                title: 'التاريخ : ',
                info: '2023/08/15',
              ),
              const SizedBox(height: 8),
              const CustomeStyleServiceInfos(
                title: ' وقت إكمال الخدمة : ',
                info: '08 مساء‘',
              ),
              const SizedBox(height: 8),
              const CustomeStyleServiceInfos(
                title: ' رفم الفريلانسر : ',
                info: '09344655435',
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
