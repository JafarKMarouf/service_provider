import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelancer_app/core/widgets/custome_search_arrowback_bar.dart';
import 'package:freelancer_app/features/main/data/models/service_model/datum_service.dart';
import 'package:shimmer/shimmer.dart';

import '../../../view_models/service_cubit/service_cubit.dart';
import 'services_grid_view.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({super.key, this.loading = true});
  final bool loading;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ServiceCubit>(context).fetchService();
    List<DatumService> services = [];
    return Scaffold(
      body: BlocConsumer<ServiceCubit, ServiceState>(
        listener: (context, state) {
          if (state is ServiceSuccess) {
            services.addAll(state.service.data!.toList());
          }
        },
        builder: (context, state) => Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, bottom: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const AspectRatio(aspectRatio: 7),
              const CustomeSearchArrowBackBar(),
              const SizedBox(height: 6),
              const Text(
                'الخدمات المتاحة',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 6),
              state is ServiceSuccess
                  ? Expanded(child: ServicesGridView(data: services))
                  : Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: 15,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
