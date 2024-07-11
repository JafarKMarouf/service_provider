import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_button.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';

import 'package:freelancer_app/core/widgets/custome_service_bar.dart';
import 'package:freelancer_app/features/booked_services/presentation/view/add_book_service/service_infos_view/widget/service_infos_book.dart';
import 'package:freelancer_app/features/booked_services/presentation/view_models/pick_book_service_infos_cubit/pick_book_service_infos_cubit.dart';

import 'widget/service_type.dart';

class ServiceInfosView extends StatelessWidget {
  final DatumService data;
  const ServiceInfosView({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
          child: Column(
            children: [
              const Expanded(child: CustomeServiceBar(title: "وصف الخدمة")),
              Expanded(flex: 2, child: ServiceType(data: data)),
              const SizedBox(height: 16),
              BlocProvider(
                create: (context) => PickBookServiceInfosCubit(),
                child: const Expanded(
                  flex: 1,
                  child: ServiceInfosBook(),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'رسوم الفحص: ${data.price} ل.س ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'الوصف : ${data.serviceDescription}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                ),
              ),
              CustomButton(
                title: 'تقدم',
                onTap: () {},
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      );
}
